#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <stdarg.h>

#include "dancingbits.h"

//------------------------------------------------------------------------------------------------------------

// For testing - define to compare new values against old values in stubs_entry.S.orig
//#define COMP_OSTUBS     1

// For testing - define to add entries to stubs_entry_2.s where new address does not match old address
// and not already defined in stubs_entry_2.s (for backwards compatability).
//#define UPDATE_STUBS2   1

//------------------------------------------------------------------------------------------------------------

// Buffer output into header and body sections

char	out_buf[32*1024] = "";
int		out_len = 0;
char	hdr_buf[32*1024] = "";
int		hdr_len = 0;
int		out_hdr = 1;

void bprintf(char *fmt, ...)
{
	va_list argp;
	va_start(argp, fmt);

	if (out_hdr)
		hdr_len += vsprintf(hdr_buf+hdr_len,fmt,argp);
	else
		out_len += vsprintf(out_buf+out_len,fmt,argp);

	va_end(argp);
}

void add_blankline()
{
	if (strcmp(hdr_buf+hdr_len-2,"\n\n") != 0)
	{
		hdr_buf[hdr_len++] = '\n';
		hdr_buf[hdr_len] = 0;
	}
}

void write_output()
{
	add_blankline();
	printf("%s",hdr_buf);
	printf("%s",out_buf);
}

//------------------------------------------------------------------------------------------------------------

void usage(char *err)
{
    printf("finsig <primary> <base> - Error = %s\n",err);
    exit(1);
}

//------------------------------------------------------------------------------------------------------------

// Load original stubs_entry.S, stubs_entry_2.s and stubs_min.S to compare results to

typedef struct _osig
{
    char        nm[100];
    uint32_t    val;
	char		sval[100];
    int         pct;
    struct _osig *nxt;
} osig;

#ifdef  COMP_OSTUBS
osig *stubs = 0;
#endif
osig *stubs2 = 0;
osig *stubs_min = 0;
osig *modemap = 0;

void print_stubs(osig *p)
{
    while (p)
    {
        bprintf("//%s 0x%08x (%s) %d\n",p->nm,p->val,p->sval,p->pct);
        p = p->nxt;
    }
}

int read_line(FILE *f, char *buf)
{
    int eof = 0;
    int len = 0;
    while (1)
    {
        if (fread(buf,1,1,f) != 1) { eof = 1; break; }
        if ((*buf == 0x0A) || (*buf == 0x0D)) break;
        len++; 
        buf++;
    }
    *buf = 0;
    return (eof == 0) || (len > 0);
}

char* get_str(char *s, char *d)
{
    while ((*s == ' ') || (*s == '\t') || (*s == ',')) s++;
    while (*s && (*s != ' ') && (*s != '\t') && (*s != ',') && (*s != ')'))
    {
        *d++ = *s++;
    }
	while (*s && (*s != ',') && (*s != ')'))
	{
		if (*s == '+')
		{
			*d++ = *s++;
			while ((*s == ' ') || (*s == '\t') || (*s == ',')) s++;
			while (*s && (*s != ' ') && (*s != '\t') && (*s != ',') && (*s != ')'))
			{
				*d++ = *s++;
			}
		}
		else s++;
	}
    *d = 0;
    return s;
}

void add_sig(char *nm, char *val, int pct, osig **hdr)
{
    osig *p = malloc(sizeof(osig));
    strcpy(p->nm, nm);
	strcpy(p->sval, val);
    p->pct = pct;
    p->nxt = *hdr;
    *hdr = p;

	uint32_t v = 0, n = 0;
	if ((strncmp(val,"0x",2) == 0) || (strncmp(val,"0X",2) == 0))
	{
		while (val)
		{
			sscanf(val,"%x",&n);
			v += n;
			val = strchr(val,'+');
			if (val) val++;
		}
	}
	else
	{
		sscanf(val,"%d",&v);
	}

	p->val = v;
}

osig* find_sig(osig* p, const char *nm)
{
    while (p)
    {
        if (strcmp(p->nm, nm) == 0) return p;
        p = p->nxt;
    }
    return 0;
}

osig* find_sig_val(osig* p, uint32_t val)
{
    while (p)
    {
        if (p->val == val) return p;
        p = p->nxt;
    }
    return 0;
}

#ifdef  COMP_OSTUBS
void load_stubs()
{
    FILE *f = fopen("stubs_entry.S.orig", "rb");

    if (f == NULL) return;

    char line[500];
    char nm[100];
    char val[12];
    int pct = 100;
    char *s;

    while (read_line(f,line))
    {
        s = strstr(line, "Best match:");
        if (s != 0)
        {
            strncpy(val,s+12,2); val[2] = 0;
            pct = atoi(val);
            continue;
        }
        
        s = strstr(line, "NSTUB(");
        if (s != 0)
        {
            if (strstr(line, "ALT: ") == 0)
            {
                s = get_str(s+6,nm);
                get_str(s,val);
                add_sig(nm, val, pct, &stubs);
                pct = 100;
                continue;
            }
        }

        s = strstr(line, "ERROR:");
        if (s != 0)
        {
            get_str(s+6,nm);
            add_sig(nm, "0", 0, &stubs);
            continue;
        }
    }
}
#endif

void load_stubs2()
{
    FILE *f = fopen("stubs_entry_2.S", "rb");

    if (f == NULL) return;

    char line[500];
    char nm[100];
    char val[12];
    int pct = 100;
    char *s;

    while (read_line(f,line))
    {
		int off = 7;
        s = strstr(line, "NHSTUB(");
		if (s == 0) { off = 6; s = strstr(line, "NSTUB("); }
		if (s == 0) { off = 4; s = strstr(line, "DEF("); }
        if (s != 0)
        {
            char *c = strstr(line, "//");
            if ((c == 0) || (c > s))
            {
                s = get_str(s+off,nm);
                get_str(s,val);
                add_sig(nm, val, pct, &stubs2);
                pct = 100;
                continue;
            }
        }
    }
}

void load_stubs_min()
{
    FILE *f = fopen("stubs_min.S", "rb");

    if (f == NULL) return;

    char line[500];
    char nm[100];
    char val[12];
    int pct = 100;
    char *s;

    while (read_line(f,line))
    {
		int off = 7;
        s = strstr(line, "NHSTUB(");
		if (s == 0) { off = 4; s = strstr(line, "DEF("); }
        if (s != 0)
        {
            char *c = strstr(line, "//");
            if ((c == 0) || (c > s))
            {
                s = get_str(s+off,nm);
                get_str(s,val);
                add_sig(nm, val, pct, &stubs_min);
                pct = 100;
                continue;
            }
        }
    }
}

void load_modemap()
{
    FILE *f = fopen("../../shooting.c", "rb");

    if (f == NULL) return;

    char line[500];
    char nm[100];
    char val[12];
	int found_modemap = 0;
    char *s;

    while (read_line(f,line))
    {
		if (found_modemap)
		{
			s = strstr(line, "};");
			if (s != 0) return;
			s = strstr(line, "MODE_");
			if (s != 0)
			{
				char *c = strstr(line, "//");
				if ((c == 0) || (c > s))
				{
					s = get_str(s,nm);
					get_str(s,val);
					add_sig(nm, val, 0, &modemap);
				}
			}
		}
		else
		{
			s = strstr(line, "modemap[");
			if (s != 0) found_modemap = 1;
		}
    }
}

//------------------------------------------------------------------------------------------------------------

// Signature match handling

typedef struct {
    uint32_t ptr;
    uint32_t fail;
    uint32_t success;
    int k;
	int sig;
} Match;

int	disp_sort = 0;

int match_compare1(const Match *p1, const Match *p2)
{
    /* NOTE: If a function has *more* matches, it will be prefered, even if it has a lower percent matches */
    if (p1->success > p2->success)
	{
		if (p2->fail != 0)
		{
			return -1;
		}
		else
		{
			return 1;
		}
    }
	else if (p1->success < p2->success)
	{
		if ((p1->fail == 0) && (p2->fail > 0))
		{
			return -1;
		}
		else
		{
			return 1;
		}
    }
	else
	{
        if (p1->fail < p2->fail)
		{
            return -1;
        }
		else if (p1->fail > p2->fail)
		{
            return 1;
        }
    }

	if (p1->sig < p2->sig)
	{
		return -1;
	}
	else if (p1->sig > p2->sig)
	{
		return 1;
	}
	
    /* scores are equal. prefer lower address */

    if (p1->ptr < p2->ptr)
	{
        return -1;
    }
	else if (p1->ptr > p2->ptr)
	{
        return 1;
    }

    return 0;
}

int match_compare(const Match *p1, const Match *p2)
{
	int r = match_compare1(p1, p2);
	if (disp_sort)
	{
		bprintf("  // %08x %2d %2d %3d %3d <-> %08x %2d %2d %3d %3d == %d\n",
			p1->ptr,p1->success,p1->fail,p1->k,p1->sig,
			p2->ptr,p2->success,p2->fail,p2->k,p2->sig,
			r);
	}
	return r;
}

#define MAX_MATCHES (8192)

Match matches[MAX_MATCHES];
int count;

void addMatch(uint32_t fadr, int s, int f, int k, int sig)
{
    matches[count].ptr = fadr;
    matches[count].success = s;
    matches[count].fail = f;
    matches[count].k = k;
	matches[count].sig = sig;
    count++;
}

void print_matches()
{
    int i;
    for (i=0; i<count; i++)
    {
        bprintf("\t//0x%08x %2d %2d %d %d\n",matches[i].ptr,matches[i].success,matches[i].fail,matches[i].k,matches[i].sig);
    }
}

//------------------------------------------------------------------------------------------------------------

// Signature structures generated by gensig2.exe

typedef struct {
    uint32_t offs;
    uint32_t value;
    uint32_t mask;
} FuncSig;

typedef struct {
    const char *name;
    FuncSig *sig;
	int ver;
} FuncsList;

//------------------------------------------------------------------------------------------------------------

// Firmware handling

typedef struct bufrange {
    uint32_t *p;
    int off;
    int len;
    struct bufrange* next;
} BufRange;

typedef struct {
    uint32_t    *buf;
    uint32_t    base;
    int         size;
    BufRange    *br, *last;
	int			dryos_ver;
    int         pid;
    int         maxram;
	char		cam[100];
} firmware;

void addBufRange(firmware *fw, int o, int l)
{
    BufRange *n = malloc(sizeof(BufRange));
    n->p = &fw->buf[o];
    n->off = o;
    n->len = l;
    n->next = 0;
    if (fw->br == 0)
    {
        fw->br = n;
    }
    else
    {
        fw->last->next = n;
    }
    fw->last = n;
}

int find_str(firmware *fw, char *str)
{
    int nlen = strlen(str);
    uint32_t nm0 = *((uint32_t*)str);
	uint32_t *p;
	int j;

    for (p = fw->buf, j = 0; j < fw->size - nlen/4; j++, p++)
    {
        if ((nm0 == *p) && (memcmp(p+1,str+4,nlen-4) == 0))
        {
			return j;
		}
	}
	
	return -1;
}

void findRanges(firmware *fw)
{
    int i, j, k;

    // Find all the valid ranges for checking (skips over large blocks of 0xFFFFFFFF)
    fw->br = 0; fw->last = 0;
    k = -1; j = 0;
    for (i = 0; i < fw->size; i++)
    {
        if (fw->buf[i] == 0xFFFFFFFF)   // Possible start of block to skip
        {
            if (k == -1)            // Mark start of possible skip block
            {
                k = i;
            }
        }
        else                        // Found end of block ?
        {
            if (k != -1)
            {
                if (i - k > 32)     // If block more than 32 words then we want to skip it
                {
                    if (k - j > 8)
                    {
                        // Add a range record for the previous valid range (ignore short ranges)
                        addBufRange(fw,j,k - j);
                    }
                    j = i;          // Reset valid range start to current position
                }
                k = -1;             // Reset marker for skip block
            }
        }
    }
    // Add range for last valid block
    if (k != -1)    
    {
        if (k - j > 8)
        {
            addBufRange(fw,j,k - j);
        }
    }
    else
    {
        if (i - j > 8)
        {
            addBufRange(fw,j,i - j);
        }
    }
}

uint32_t idx2adr(firmware *fw, int idx)
{
    return fw->base + (idx << 2);
}

uint32_t adr2idx(firmware *fw, int adr)
{
    return (adr - fw->base) >> 2;
}

uint32_t ptr2idx(firmware *fw, int idx)
{
    return (fw->buf[idx] - fw->base) >> 2;
}

int idxFollowBranch(firmware *fw, int fidx, int offset)
{
    if (offset)
    {
		uint32_t msk = ~(offset & 0xFF000000);
        fidx += ((offset & 0x00FFFFFF) - 1);
        uint32_t inst = fw->buf[fidx];
        if ((inst & (0xFF000000&msk)) == (0xEA000000&msk))    // Branch (not BL)?
        {
            int o = inst & 0x00FFFFFF;
            if (o & 0x00800000) o |= 0xFF000000;
            fidx = fidx + o + 2;
        }
    }
    return fidx;
}

uint32_t followBranch(firmware *fw, uint32_t fadr, int offset)
{
    if (offset)
    {
		uint32_t msk = ~(offset & 0xFF000000);
        uint32_t fidx = adr2idx(fw,fadr);  // function index
        fidx += ((offset & 0x00FFFFFF) - 1);
        uint32_t inst = fw->buf[fidx];
        if ((inst & (0xFF000000&msk)) == (0xEA000000&msk))    // Branch (not BL)?
        {
            int o = inst & 0x00FFFFFF;
            if (o & 0x00800000) o |= 0xFF000000;
            fadr = idx2adr(fw,fidx+o+2);
        }
    }
    return fadr;
}

uint32_t followBranch2(firmware *fw, uint32_t fadr, int offset)
{
	fadr = followBranch(fw, fadr, offset);
	if ((offset & 0x00FFFFFF) == 1)
		fadr = followBranch(fw, fadr, offset);
	return fadr;
}

uint32_t ADR2adr(firmware *fw, int offset)  // decode ADR instruction at offset and return firmware address pointed to
{
    uint32_t inst = fw->buf[offset];
    int rot = 32 - ((inst & 0xF00) >> 7);
    int offst = (inst & 0xFF) <<rot;
    uint32_t fadr = 0;
    switch (inst & 0x01E00000)
    {
    case 0x00400000:    // SUB
        fadr = idx2adr(fw,offset+2)-offst;
        break;
    case 0x00800000:    // ADD
        fadr = idx2adr(fw,offset+2)+offst;
        break;
    case 0x01A00000:    // MOV
        //fprintf(stderr,"***** ADR2adr MOV\n");
        break;
    case 0x01E00000:    // MVN
        //fprintf(stderr,"***** ADR2adr MVN\n");
        break;
    }
    return fadr;
}

uint32_t ALUop2(firmware *fw, int offset)  // decode operand2 from ALU inst (not complete!)
{
    uint32_t inst = fw->buf[offset];
    int rot = 32 - ((inst & 0xF00) >> 7);
    int offst = (inst & 0xFF) <<rot;
    uint32_t fadr = 0;
    switch (inst & 0x03E00000)
    {
    case 0x02400000:    // SUB Immed
    case 0x02800000:    // ADD Immed
    case 0x03A00000:    // MOV Immed
    case 0x03C00000:    // BIC Immed
		fadr = offst;
        break;
    }
    return fadr;
}

uint32_t LDR2adr(firmware *fw, int offset)  // decode LDR instruction at offset and return firmware address pointed to
{
    uint32_t inst = fw->buf[offset];
    int offst = (inst & 0xFFF);
    uint32_t fadr = (inst & 0x00800000)?idx2adr(fw,offset+2)+offst:idx2adr(fw,offset+2)-offst;
    return fadr;
}

uint32_t LDR2idx(firmware *fw, int offset)  // decode LDR instruction at offset and return firmware buffer index of the new address
{
	return adr2idx(fw,LDR2adr(fw,offset));
}

int isLDR_PC(firmware *fw, int offset)
{
	return ((fw->buf[offset] & 0xFE1F0000) == 0xE41F0000);
}

int isLDR_PC_cond(firmware *fw, int offset)
{
	return ((fw->buf[offset] & 0x0E1F0000) == 0x041F0000);
}

int isSTR_PC(firmware *fw, int offset)
{
	return ((fw->buf[offset] & 0xFE1F0000) == 0xE40F0000);
}

int isLDR(firmware *fw, int offset)
{
	return ((fw->buf[offset] & 0xFE100000) == 0xE4100000);
}

int isSTR(firmware *fw, int offset)
{
	return ((fw->buf[offset] & 0xFE100000) == 0xE4000000);
}

int isBL(firmware *fw, int offset)
{
	return ((fw->buf[offset] & 0xFF000000) == 0xEB000000);	// BL
}

void load_firmware(firmware *fw, char *filename, char *base_addr)
{
    FILE *f = fopen(filename, "rb");

    if (f == NULL)
	{
		fprintf(stderr,"Error opening %s\n",filename);
        usage("firmware open");
	}

    fw->base = strtoul(base_addr, NULL, 0);

    fseek(f,0,SEEK_END);
    fw->size = (ftell(f)+3)/4;
    fseek(f,0,SEEK_SET);

    // Max sig size if 32, add extra space at end of buffer and fill with 0xFFFFFFFF
    // Allows sig matching past end of firmware without checking each time in the inner loop
    fw->buf = malloc((fw->size+32)*4);
    fread(fw->buf, 4, fw->size, f);
    fclose(f);
	
    memset(&fw->buf[fw->size],0xff,32*4);

	bprintf("// Camera info:\n");
	
	// Get DRYOS version
	fw->dryos_ver = 0;
	int k = find_str(fw, "DRYOS version 2.3, release #");
	if (k == -1)
	{
		bprintf("//   Can't find DRYOS version !!!\n\n");
	}
	else
	{
		fw->dryos_ver = atoi(((char*)&fw->buf[k])+28);
        if (fw->dryos_ver > 49)
    		bprintf("//   DRYOS R%d (%s) *** New DRYOS Version - please update finsig_dryos.c ***\n",fw->dryos_ver,(char*)&fw->buf[k]);
        else
    		bprintf("//   DRYOS R%d (%s)\n",fw->dryos_ver,(char*)&fw->buf[k]);
	}
	
	// Get firmware version info
	k = find_str(fw, "Firmware Ver ");
	if (k == -1)
	{
		bprintf("//   Can't find firmware version !!!\n\n");
	}
	else
	{
		bprintf("//   %s",(char*)&fw->buf[k]);
		bprintf("\n");
	}

	// Get camera name & platformid
	int fsize = -((int)fw->base)/4;
	int cam_idx = 0;
    int pid_idx = 0;
	switch (fw->dryos_ver)
	{
	case 20:
	case 23:
	case 31:
	case 39: 
        cam_idx = (0xFFFE0110 - fw->base) / 4; 
        pid_idx = (0xFFFE0130 - fw->base) / 4; 
        break;
	case 43:
	case 45: 
        cam_idx = (0xFFFE00D0 - fw->base) / 4; 
        pid_idx = (0xFFFE0130 - fw->base) / 4; 
        break;
	case 47: 
        cam_idx = (((fw->base==0xFF000000)?0xFFF40170:0xFFFE0170) - fw->base) / 4; 
        pid_idx = (((fw->base==0xFF000000)?0xFFF40040:0xFFFE0040) - fw->base) / 4; 
        break;
	case 49: 
        cam_idx = (((fw->base==0xFF000000)?0xFFF40190:0xFFFE0170) - fw->base) / 4; 
        pid_idx = (((fw->base==0xFF000000)?0xFFF40040:0xFFFE0040) - fw->base) / 4; 
        break;
	}

    if (fsize > (fw->size + 256))
	{
		bprintf("//   Possible corrupt firmware dump - file size to small for start address 0x%08x\n",fw->base);
		bprintf("//     file size = %.2fMB, should be %.2fMB\n", ((double)fw->size*4.0)/(1024.0*1024.0),((double)fsize*4.0)/(1024.0*1024.0));
	}
	
	strcpy(fw->cam,"Unknown");
	if ((cam_idx < fw->size) && (strncmp((char*)&fw->buf[cam_idx],"Canon ",6) == 0))
	{
		strcpy(fw->cam,(char*)&fw->buf[cam_idx]);
		bprintf("//   %s\n",fw->cam);
	}
	else
	{
		bprintf("//   Could not find Camera name - possible corrupt firmware dump\n");
	}

	bprintf("\n// Values for makefile.inc\n");

    if ((pid_idx > 0) && (pid_idx < fw->size))
    {
        fw->pid = fw->buf[pid_idx] & 0xFFFF;
		bprintf("//   PLATFORMID = %d (0x%04x) // Found @ 0x%08x\n",fw->pid,fw->pid,idx2adr(fw,pid_idx));
    }
    else fw->pid = 0;

    // Calc MAXRAMADDR
    if (((fw->buf[0x10] & 0xFFFFFF00) == 0xE3A00000) && (fw->buf[0x11] == 0xEE060F12))
    {
        fw->maxram = (1 << (((fw->buf[0x10] & 0x3E) >> 1) + 1)) - 1;
    }
    else if (((fw->buf[0x14] & 0xFFFFFF00) == 0xE3A00000) && (fw->buf[0x15] == 0xEE060F12))
    {
        fw->maxram = (1 << (((fw->buf[0x14] & 0x3E) >> 1) + 1)) - 1;
    }
    else fw->maxram = 0;

    if (fw->maxram != 0)
		bprintf("//   MAXRAMADDR = 0x%08x\n",fw->maxram);

    uint32_t ofst = adr2idx(fw,0xFFFF0000);    // Offset of area to find dancing bits
    if ((ofst < fw->size) && (fw->buf[ofst] == 0xEA000001) && isLDR_PC(fw,ofst+1))
    {
        // Get KEYSYS value
        ofst = adr2idx(fw,fw->buf[LDR2idx(fw,ofst+1)]);     // Address of firmware encryption key
        if (ofst < fw->size)
        {
            char *ksys = "? Not found, possible new firmware encryption key.";
            switch (fw->buf[ofst])
            {
            case 0x70726964:    ksys = "d3   "; break;
            case 0x646C726F:    ksys = "d3enc"; break;
            case 0x774D450B:    ksys = "d4   "; break;
            case 0x80751A95:    ksys = "d4a  "; break;
            case 0x76894368:    ksys = "d4b  "; break;
            case 0x50838EF7:    ksys = "d4c  "; break;
            }
            bprintf("//   KEYSYS = %s              // Found @ 0x%08x\n",ksys,idx2adr(fw,ofst));
        }

        // Get NEED_ENCODED_DISKBOOT value
        ofst = ofst + 4; // Address of dancing bits data (try after firmware key)
        if (ofst < fw->size)
        {
            int fnd = 0, i, j;
            for (i=0; i<VITALY && !fnd; i++)
            {
                fnd = i+1;
                for (j=0; j<8 && fnd; j++)
                {
                    if ((fw->buf[ofst+j] & 0xFF) != _chr_[i][j])
                    {
                        fnd = 0;
                    }
                }
            }
            if (!fnd)
            {
                // Try before firmware key
                ofst = ofst - 12;
                for (i=0; i<VITALY && !fnd; i++)
                {
                    fnd = i+1;
                    for (j=0; j<8 && fnd; j++)
                    {
                        if ((fw->buf[ofst+j] & 0xFF) != _chr_[i][j])
                        {
                            fnd = 0;
                        }
                    }
                }
            }
            if (fnd)
            {
        		bprintf("//   NEED_ENCODED_DISKBOOT = %d   // Found @ 0x%08x\n",fnd,idx2adr(fw,ofst));
            }
            else
            {
        		bprintf("//   NEED_ENCODED_DISKBOOT = ? Not found, possible new 'dancing bits' entry needed. // Found @ 0x%08x\n",idx2adr(fw,ofst));
            }
        }
    }

	bprintf("\n");
}

//------------------------------------------------------------------------------------------------------------

// Signature matches to save for reference by later signature searches

typedef struct {
	char		*name;
	uint32_t	val;
} sig_stuff;

sig_stuff saved_sigs[] = {
	{ "task_PhySw", 0 },
	{ "kbd_p1_f", 0 },
	{ "kbd_read_keys", 0 },
	{ "UpdateMBROnFlash", 0 },
	{ "MakeSDCardBootable", 0 },
	{ "CreateJumptable", 0 },
	{ "strtol", 0 },
	{ "LockAndRefresh", 0 },
	{ "StartRecModeMenu", 0 },
	{ "GetSDProtect", 0 },
	{ "DispCon_ShowBitmapColorBar", 0 },
	{ "FreeUncacheableMemory", 0 },
	{ "GetParameterData", 0 },
	
	{ 0, 0 }
};

sig_stuff min_ver[] = {
	{ "CreateJumptable", 10000 },
	{ "ScreenLock", 39 },
	{ "ScreenUnlock", 39 },
	{ "MakeSDCardBootable", 47 },
	
	{ 0, 0 }
};

sig_stuff max_ver[] = {
	{ "UpdateMBROnFlash", 45 },
	
	{ 0, 0 }
};

int find_min_ver(const char *name)
{
	int i;
	for (i=0; min_ver[i].name != 0; i++)
	{
		if (strcmp(name,min_ver[i].name) == 0)
		{
			return min_ver[i].val;
		}
	}
	return 0;
}

int find_max_ver(const char *name)
{
	int i;
	for (i=0; max_ver[i].name != 0; i++)
	{
		if (strcmp(name,max_ver[i].name) == 0)
		{
			return max_ver[i].val;
		}
	}
	return 99999;
}

uint32_t find_saved_sig(const char *name)
{
	int i;
	for (i=0; saved_sigs[i].name != 0; i++)
	{
		if (strcmp(name,saved_sigs[i].name) == 0)
		{
			return i;
		}
	}
	return -1;
}

void save_sig(const char *name, uint32_t val)
{
	int i = find_saved_sig(name);
	if (i >= 0)
	{
		saved_sigs[i].val = val;
	}
}

uint32_t get_saved_sig(firmware *fw, const char *name)
{
	int j = find_saved_sig(name);
	if (j >= 0)
	{
		if (saved_sigs[j].val == 0)
		{
			int find_func(const char* name);
			int k1 = find_func(name);
			if (k1 >= 0)
			{
				int find_matches(firmware*,int);
				find_matches(fw, k1);
				count = 0;
			}
			else
			{
				void find_str_sig_matches(firmware*,const char*);
				find_str_sig_matches(fw, name);
				count = 0;
			}
		}
		if (saved_sigs[j].val == 0)
		{
			j = -1;
		}
	}
	return j;
}

//------------------------------------------------------------------------------------------------------------

// New string / signature matching structure

typedef struct {
    int     type;           // 1 = func*, string, 2 = string, ... string*, func*, 3 = ADR Rx, func, ADR Ry, string, BL, ... string
    char    *name;
    char    *ev_name;
    int     offset;
	int		dryos20_offset;
	int		dryos23_offset;
	int		dryos31_offset;
	int		dryos39_offset;
	int		dryos43_offset;
	int		dryos45_offset;
	int		dryos47_offset;
	int		dryos49_offset;
} string_sig;

#if defined(PLATFORMOS_dryos)
#include "signatures_dryos.h"
uint32_t log_test[] = {
	0x1526E50E, 0x3FDBCB7B, 0
};
string_sig string_sigs[] = {
	{ 1, "AllocateMemory", "AllocateMemory", 1 },
    { 1, "Close", "Close", 1 },
	{ 1, "CreateTask", "CreateTask", 1 },
	{ 1, "DoAFLock", "PT_DoAFLock", 0x01000002 },
    { 1, "ExitTask", "ExitTask", 1 },
	{ 1, "exmem_alloc", "ExMem.AllocCacheable", 4 },
    { 1, "Fclose_Fut", "Fclose_Fut", 1 },
    { 1, "Feof_Fut", "Feof_Fut", 1 },
    { 1, "Fflush_Fut", "Fflush_Fut", 1 },
    { 1, "Fgets_Fut", "Fgets_Fut", 1 },
    { 1, "Fopen_Fut", "Fopen_Fut", 1 },
    { 1, "Fread_Fut", "Fread_Fut", 1 },
	{ 1, "FreeMemory", "FreeMemory", 1 },
    { 1, "Fseek_Fut", "Fseek_Fut", 1 },
    { 1, "Fwrite_Fut", "Fwrite_Fut", 1 },
	{ 1, "GetParameterData", "PTM_RestoreUIProperty", 0xF0000004 },
	{ 1, "GetPropertyCase", "PT_GetPropertyCaseString", 1 },
	{ 1, "GetPropertyCase", "PT_GetPropertyCaseInt", 0x0100000F },
	{ 1, "GetSDProtect", "GetSDProtect", 1 },
	{ 1, "GetSystemTime", "GetSystemTime", 1 },
	{ 1, "LEDDrive", "LEDDrive", 1 },
    { 1, "LockMainPower", "LockMainPower", 1 },
    { 1, "Lseek", "Lseek", 1 },
    { 1, "lseek", "Lseek", 1 },
    { 1, "memcpy", "memcpy", 1 },
    { 1, "memcmp", "memcmp", 1 },
    { 1, "memset", "memset", 1 },
    { 1, "NewTaskShell", "NewTaskShell", 1 },
    { 1, "Open", "Open", 1 },
    { 1, "PostLogicalEventToUI", "PostLogicalEventToUI", 1 },
    { 1, "PostLogicalEventForNotPowerType", "PostLogicalEventForNotPowerType", 1 },
    { 1, "Read", "Read", 1 },
    { 1, "read", "Read", 1 },
	{ 1, "RefreshPhysicalScreen", "RefreshPhysicalScreen", 1 },
    { 1, "SetAutoShutdownTime", "SetAutoShutdownTime", 1 },
    { 1, "SetCurrentCaptureModeType", "SetCurrentCaptureModeType", 1 },
    { 1, "SetLogicalEventActive", "UiEvnt_SetLogicalEventActive", 1 },
    { 1, "SetParameterData", "PTM_BackupUIProperty", 1 },
	{ 1, "SetPropertyCase", "PT_SetPropertyCaseInt", 0x01000003 },
	{ 1, "SetScriptMode", "SetScriptMode", 1 },
    { 1, "SleepTask", "SleepTask", 1 },
    { 1, "strcmp", "strcmp", 0 },
    { 1, "strcpy", "strcpy", 1 },
    { 1, "strlen", "strlen", 1 },
    { 1, "strtol", "atol", 3 },
    { 1, "TakeSemaphore", "TakeSemaphore", 1 },
    { 1, "UIFS_WriteFirmInfoToFile", "UIFS_WriteFirmInfoToFile", 1 },
	{ 1, "UnlockAF", "PT_UnlockAF", 0x01000002 },
    { 1, "UnlockMainPower", "UnlockMainPower", 1 },
    { 1, "VbattGet", "VbattGet", 1 },
    { 1, "Write", "Write", 1 },
    { 1, "write", "Write", 1 },

    { 2, "GetBatteryTemperature", "GetBatteryTemperature", 1 },
    { 2, "GetCCDTemperature", "GetCCDTemperature", 1 },
    { 2, "GetOpticalTemperature", "GetOpticalTemperature", 1 },
    { 2, "GetFocusLensSubjectDistance", "GetCurrentTargetDistance", 1 },
    { 2, "GetZoomLensCurrentPoint", "GetZoomLensCurrentPoint", 1 },
    { 2, "GetZoomLensCurrentPosition", "GetZoomLensCurrentPosition", 1 },
    { 2, "MoveFocusLensToDistance", "MoveFocusLensToDistance", 1 },
    { 2, "MoveZoomLensWithPoint", "MoveZoomLensWithPoint", 1 },
    { 2, "GetCurrentAvValue", "GetCurrentAvValue", 1 },
	{ 2, "PT_MoveOpticalZoomAt", "PT_MoveOpticalZoomAt", 1 },
	{ 2, "PT_MoveDigitalZoomToWide", "PT_MoveDigitalZoomToWide", 1 },
	{ 2, "MoveIrisWithAv", "MoveIrisWithAv", 1},
    { 2, "PutInNdFilter", "TurnOnNdFilter", 1 },
    { 2, "PutOutNdFilter", "TurnOffNdFilter", 1 },
    { 2, "PutInNdFilter", "PutInNdFilter", 1 },
    { 2, "PutOutNdFilter", "PutOutNdFilter", 1 },
	{ 2, "IsStrobeChargeCompleted", "EF.IsChargeFull", 1 },
	{ 2, "GetPropertyCase", "PT_GetPropertyCaseInt", 0x01000012 },
	{ 2, "SetPropertyCase", "PT_SetPropertyCaseInt", 0x01000008 },
	{ 2, "SetPropertyCase", "PT_SetPropertyCaseInt", 0x01000009 },
	{ 2, "UnlockAF", "PT_UnlockAF", 0x01000002 },
	{ 2, "DoAFLock", "PT_DoAFLock", 0x01000002 },
	{ 2, "GetSystemTime", "PT_GetSystemTime", 0x01000003 },
	{ 2, "PT_PlaySound", "PT_PlaySound", 0x01000005 },
	{ 2, "StartRecModeMenu", "StartRecModeMenu", 1 },
	{ 2, "GetSDProtect", "GetSDProtect", 1 },
	{ 2, "DispCon_ShowBitmapColorBar", "DispCon_ShowBitmapColorBar", 1 },
	{ 2, "SetAE_ShutterSpeed", "SetAE_ShutterSpeed", 1 },
	
	{ 3, "AllocateMemory", "AllocateMemory", 1 },
	{ 3, "FreeMemory", "FreeMemory", 1 },
    { 3, "PostLogicalEventToUI", "PostLogicalEventToUI", 1 },
    { 3, "PostLogicalEventForNotPowerType", "PostLogicalEventForNotPowerType", 1 },
    { 3, "LockMainPower", "LockMainPower", 1 },
    { 3, "UnlockMainPower", "UnlockMainPower", 1 },
    { 3, "SetAutoShutdownTime", "SetAutoShutdownTime", 1 },
    { 3, "NewTaskShell", "NewTaskShell", 1 },
    { 3, "VbattGet", "VbattGet", 1 },
	{ 3, "LEDDrive", "LEDDrive", 1 },
	{ 3, "SetPropertyCase", "PT_SetPropertyCaseInt", 0x01000003 },
	{ 3, "UnlockAF", "PT_UnlockAF", 0x01000002 },
	{ 3, "DoAFLock", "PT_DoAFLock", 0x01000002 },
    { 3, "UIFS_WriteFirmInfoToFile", "UIFS_WriteFirmInfoToFile", 1 },
	{ 3, "PT_MoveOpticalZoomAt", "PT_MoveOpticalZoomAt", 1 },
	{ 3, "PT_MoveDigitalZoomToWide", "PT_MoveDigitalZoomToWide", 1 },
	{ 3, "PT_PlaySound", "PT_PlaySound", 1 },
	{ 3, "exmem_alloc", "ExMem.AllocCacheable", 4 },
	{ 3, "GetSDProtect", "GetSDProtect", 1 },

    { 4, "TurnOnBackLight", "TurnOnBackLight", 1 },
    { 4, "TurnOffBackLight", "TurnOffBackLight", 1 },
    { 4, "EnterToCompensationEVF", "SSAPI::EnterToCompensationEVF", 1 },
    { 4, "EnterToCompensationEVF", "ExpComp On", 1 },
    { 4, "EnterToCompensationEVF", "ExpOn", 1 },
    { 4, "ExitFromCompensationEVF", "SSAPI::ExitFromCompensationEVF", 1 },
    { 4, "ExitFromCompensationEVF", "ExpComp Off", 1 },
    { 4, "ExitFromCompensationEVF", "ExpOff", 1 },
    { 4, "PB2Rec", "AC:PB2Rec", 1 },
    { 4, "PB2Rec", "AC:PB2Rec", 6 },
    { 4, "PB2Rec", "AC:PB2Rec", 11 },
    { 4, "Rec2PB", "AC:Rec2PB", 1 },
	{ 4, "RefreshPhysicalScreen", "ScreenUnLock", 1 },
	{ 4, "RefreshPhysicalScreen", "ScreenUnLock", 7 },
	{ 4, "RefreshPhysicalScreen", "ScreenUnLock", 15 },
	{ 4, "RefreshPhysicalScreen", "Reduce ScreenUnLock", 5 },
	{ 4, "RefreshPhysicalScreen", "Window:IneffectiveLockPhysicalScreen", 8 },
	{ 4, "UnsetZoomForMovie", "ZoomCon_UnsetZoomForMovie", 1 },
	{ 4, "ExpCtrlTool_StopContiAE", "StopContiAE", 9 },
	{ 4, "ExpCtrlTool_StopContiAE", "StopContiAE", 10 },
	{ 4, "ExpCtrlTool_StartContiAE", "StartContiAE", 9 },
	{ 4, "ExpCtrlTool_StartContiAE", "StartContiAE", 10 },

    { 5, "UIFS_WriteFirmInfoToFile", "UIFS_WriteFirmInfoToFile", 1 },

    { 6, "Restart", "Bye", 0 },
	{ 6, "GetImageFolder", "GetCameraObjectTmpPath ERROR[ID:%lx] [TRY:%lx]\n", 0 },
	
	{ 7, "task_CaptSeq", "CaptSeqTask", 1 },
	{ 7, "task_ExpDrv", "ExpDrvTask", 1 },
	{ 7, "task_InitFileModules", "InitFileModules", 1 },
	{ 7, "task_MovieRecord", "MovieRecord", 1 },
	{ 7, "task_PhySw", "PhySw", 1 },
	{ 7, "task_RotaryEncoder", "RotaryEncoder", 1 },
	{ 7, "task_RotaryEncoder", "RotarySw", 1 },
	
	{ 8, "WriteSDCard", "Mounter.c", 0 }, 
	
	//																	 R20   R23   R31   R39   R43   R45   R47   R49
	{ 9, "kbd_p1_f", "task_PhySw", 0x01000001,							   5,    5,    5,    5,    5,    5,    5,    5 },
	{ 9, "kbd_p2_f", "task_PhySw", 0xf1000001,							   7,    7,    7,    7,    7,    7,    7,    7 },
	{ 9, "kbd_read_keys", "kbd_p1_f", 0x01000001,						   2,    2,    2,    2,    2,    2,    2,    2 },
	{ 9, "kbd_p1_f_cont", "kbd_p1_f", 0,								   3,    3,    3,    3,    3,    3,    3,    3 },
	{ 9, "kbd_read_keys_r2", "kbd_read_keys", 0x0100000C },
	{ 9, "GetKbdState", "kbd_read_keys", 0x01000009 },
	{ 9, "GetKbdState", "kbd_read_keys", 0x0100000A },
	{ 9, "strtolx", "strtol", 2 },
	
	{ 10, "task_CaptSeq", "CaptSeqTask", 1 },
	{ 10, "task_ExpDrv", "ExpDrvTask", 1 },
	{ 10, "task_InitFileModules", "InitFileModules", 1 },
	{ 10, "task_MovieRecord", "MovieRecord", 1 },
	{ 10, "task_PhySw", "PhySw", 1 },
	{ 10, "task_RotaryEncoder", "RotaryEncoder", 1 },
	{ 10, "task_RotaryEncoder", "RotarySw", 1 },

	//																	 R20   R23   R31   R39   R43   R45   R47   R49
	{ 11, "DebugAssert", "\nAssert: File %s Line %d\n", 0,				   5,    5,    5,    5,    5,    5,    5,    5 },
	{ 11, "set_control_event", "Button:0x%08X:%s", 0x01000001,			  14,   14,   14,   14,   14,   14,   14,   14 },
	{ 11, "set_control_event", "Button:0x%08X:%s", 0x01000001,			  15,   15,   15,   15,   15,   15,   15,   15 },
	{ 11, "set_control_event", "Button:0x%08X:%s", 0x01000001,			  20,   20,   20,   20,   20,   20,   19,   20 },
	{ 11, "_log", (char*)log_test, 0x01000001,							   1,    1,    1,    1,    1,    1,    1,    1 },
	
	//																	 R20   R23   R31   R39   R43   R45   R47   R49
	{ 12, "DeleteFile_Fut", "DeleteFile_Fut", 1,						0x38, 0x38, 0x4C, 0x4C, 0x4C, 0x54, 0x54, 0x54 },
	{ 12, "AllocateUncacheableMemory", "AllocateUncacheableMemory", 1, 	0x2C, 0x2C, 0x2C, 0x2C, 0x2C, 0x34, 0x34, 0x34 },
	{ 12, "FreeUncacheableMemory", "FreeUncacheableMemory", 1, 			0x30, 0x30, 0x30, 0x30, 0x30, 0x38, 0x38, 0x38 },
	{ 12, "free", "free", 1,											0x28, 0x28, 0x28, 0x28, 0x28, 0x30, 0x30, 0x30 },
	{ 12, "malloc", "malloc", 0x01000003,								0x24, 0x24, 0x24, 0x24, 0x24, 0x2C, 0x2C, 0x2C },
	{ 12, "TakeSemaphore", "TakeSemaphore", 1,							0x14, 0x14, 0x14, 0x14, 0x14, 0x1C, 0x1C, 0x1C },
	{ 12, "GiveSemaphore", "GiveSemaphore", 1,							0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x20, 0x20 },
	{ 12, "_log10", "_log10", 0x01000006,							   0x278,0x280,0x280,0x284,0x294,0x2FC,0x2FC,0x31C },
	{ 12, "_log10", "_log10", 0x01000006,							   0x000,0x278,0x27C,0x000,0x000,0x000,0x000,0x000 },
	{ 12, "_log10", "_log10", 0x01000006,							   0x000,0x000,0x2C4,0x000,0x000,0x000,0x000,0x000 },
	
	{ 13, "strftime", "Sunday", 1 },
	
	{ 14, "_pow", "_pow", 0 },
	
    { 0, 0, 0, 0 }
};
#else
#error Incorrect platform OS - DryOS only.
#endif

int find_func(const char* name)
{
	int i;
	for (i=0; func_list[i].name != 0; i++)
	{
		if (strcmp(name, func_list[i].name) == 0)
		{
			return i;
		}
	}
	return -1;
}

int dryos_offset(firmware *fw, string_sig *sig)
{
	switch (fw->dryos_ver)
	{
	case 20:	return sig->dryos20_offset;
	case 23:	return sig->dryos23_offset;
	case 31:	return sig->dryos31_offset;
	case 39:	return sig->dryos39_offset;
	case 43:	return sig->dryos43_offset;
	case 45:	return sig->dryos45_offset;
	case 47:	return sig->dryos47_offset;
	case 49:	return sig->dryos49_offset;
	}
	return 0;
}
	
//------------------------------------------------------------------------------------------------------------

// Optional functions, if not found no error is written to output

char *optional[] = {
	"DebugAssert",
	"PT_MoveOpticalZoomAt",
	"PT_MoveDigitalZoomToWide",
	"PT_ChangeZoomSpeed",
	"MoveIrisWithAv",
	"err_init_task",
	"PutInNdFilter",
	"PutOutNdFilter",
	"GiveSemaphore",
	"GetImageFolder",
	"UnsetZoomForMovie",
	"task_RotaryEncoder",
	"task_PhySw",
	"MakeSDCardBootable",
	"LEDDrive",
	0
};

//------------------------------------------------------------------------------------------------------------

// Load optional list of signatures to ignore

char* ignore_list[200];
int num_ignore = 0;
char* ignore_names;

void load_ignore_list()
{
    FILE *f = fopen("../ignore_stubs.txt","r");
    if (f != NULL)
    {
        fseek(f,0,SEEK_END);
        int size = ftell(f);
        fseek(f,0,SEEK_SET);

        ignore_names = malloc(size+1);
        fread(ignore_names, 1, size, f);
        ignore_names[size] = 0;

        int save = 1;
        int i;
        for (i = 0; i < size; i++)
        {
            if (save)
            {
                ignore_list[num_ignore] = &ignore_names[i];
                num_ignore++;
                save = 0;
            }
            if (ignore_names[i] == 0x0d) { ignore_names[i] = 0; }
            if (ignore_names[i] == 0x0a) { ignore_names[i] = 0; save = 1; }
        }

        fclose(f);
    }
}

int is_in_list(const char *str, char *list[])
{
	int i;
	for (i=0; list[i] != 0; i++)
	{
		if (strcmp(str,list[i]) == 0)
		{
			return 1;
		}
	}
	return 0;
}

//------------------------------------------------------------------------------------------------------------

// New string / signature matching functions

// Sig pattern:
//		Function pointer	-	DCD	func
//		String				-	DCB	"func"
int find_strsig1(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
    uint32_t nm0 = *((uint32_t*)sig->ev_name);
	uint32_t *p;
	int j;

    for (p = fw->buf, j = 0; j < fw->size - nlen/4; j++, p++)
    {
        if ((nm0 == *p) && (memcmp(p+1,sig->ev_name+4,nlen-3) == 0))
        {
            uint32_t fadr = fw->buf[j-1];       // function address (*padr)
            if (fadr >= fw->base)
            {
				if (sig->offset > 1) fadr = followBranch(fw, fadr, 1);
                fadr = followBranch2(fw, fadr, sig->offset);
                //fprintf(stderr,"%s %08x\n",curr_name,fadr);
                addMatch(fadr,32,0,k,101);
                return 1;
            }
        }
    }
	return 0;
}

// Sig pattern:
//		String pointer		-		DCD	str
//		Function pointer	-		DCD	func
//				...
//		String				-	str	DCB	"func"
int find_strsig2(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
	int j;
	
    char *c = (char*)(&fw->buf[0]);
    for (j = 0; j < fw->size*4 - nlen; j++, c++)
    {
        if (strcmp(c,sig->ev_name) == 0)
        {
            uint32_t sadr = fw->base + j;        // string address
            int j1;
            uint32_t *p1;
            for (p1 = fw->buf, j1 = 0; j1 < fw->size - nlen/4; j1++, p1++)
            {
                if (*p1 == sadr)                // pointer to string?
                {
                    uint32_t fadr = fw->buf[j1+1];      // function address (*padr)
                    if (fadr >= fw->base)
                    {
                        uint32_t bfadr = followBranch2(fw, fadr, sig->offset);
						if ((sig->offset <= 1) || (bfadr != fadr))
						{
							//fprintf(stderr,"%s %08x\n",curr_name,fadr);
							addMatch(bfadr,32,0,k,102);
							return 1;
						}
                    }
                }
            }
        }
    }

	return 0;
}

// Sig pattern:
//		Load Func Address	-	ADR	Rx, func
//		Load String Address	-	ADR	Rx, "func"
//		Branch				-	BL
//				...
//		String				-	DCB	"func"
int find_strsig3(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
	uint32_t nm0 = *((uint32_t*)sig->ev_name);
	uint32_t *p;
	int j;
	
	for (p = fw->buf, j = 0; j < fw->size - nlen/4; j++, p++)
	{
		if ((nm0 == *p) && (memcmp(p+1,sig->ev_name+4,nlen-3) == 0))
		{
			uint32_t sadr = idx2adr(fw,j);        // string address
			int j1;
			uint32_t *p1;
			for (p1 = p-3, j1 = j-3; j1 >= 0; j1--, p1--)
			{
				if (((p1[1] & 0xFE0F0000) == 0xE20F0000) && // ADR ?
					((p1[2] & 0xFE000000) == 0xEA000000))   // B or BL ?
				{
					uint32_t padr = ADR2adr(fw,j1+1);
					if (padr == sadr)
					{
						int j2 = j1;
						int found = 0;
						if ((p1[0] & 0xFE0F0000) == 0xE20F0000) // ADR ?
							found = 1;
						else
						{
							uint32_t *p2;
							for (p2 = p1-2, j2 = j1-2; j2 >= 0 && j2 >= j1-4096; j2--, p2--)
							{
								if (((p2[0] & 0xFE0F0000) == 0xE20F0000) && // ADR ?
									((p2[1] & 0xFF000000) == 0xEA000000))   // B
								{
									uint32_t fa = idx2adr(fw,j2+1);
									fa = followBranch(fw,fa,1);
									if (adr2idx(fw,fa) == j1+1)
									{
										found = 1;
										break;
									}
								}
							}
						}
						if (found)
						{
							uint32_t fadr = ADR2adr(fw,j2);
							if (sig->offset > 1) fadr = followBranch(fw, fadr, 1);
							fadr = followBranch2(fw, fadr, sig->offset);
							//fprintf(stderr,"%s %08x\n",curr_name,fadr);
							addMatch(fadr,32,0,k,103);
							return 1;
						}
					}
				}
			}
		}
	}

	return 0;
}

// Sig pattern:
//		Save Regs			-	STMFD
//				... (ofst)
//		Load String Address	-	ADR	Rx, "func"
//				...
//		String				-	DCB	"func"
int find_strsig4(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
	uint32_t nm0 = *((uint32_t*)sig->ev_name);
	uint32_t *p;
	int j;

	for (p = fw->buf, j = 0; j < fw->size - nlen/4; j++, p++)
	{
		if ((nm0 == *p) && (memcmp(p+1,sig->ev_name+4,nlen-3) == 0))
		{
			uint32_t sadr = idx2adr(fw,j);        // string address
			int j1;
			uint32_t *p1;
			int ofst = sig->offset;
			for (p1 = p-ofst-1, j1 = j-ofst-1; j1 >= 0; j1--, p1--)
			{
				if (((p1[0] & 0xFFFF0000) == 0xE92D0000) && 	// STMFD
					((p1[ofst] & 0xFE0F0000) == 0xE20F0000))   	// ADR ?
				{
					uint32_t padr = ADR2adr(fw,j1+ofst);
					if (padr == sadr)
					{
						uint32_t fadr = idx2adr(fw,j1);
						//fprintf(stderr,"%s %08x\n",curr_name,fadr);
						addMatch(fadr,32,0,k,104);
						return 1;
					}
				}
			}
		}
	}
 
	return 0;
}

// Sig pattern:
//		Load Func Address	-	LDR	Rx, =func
//		Load String Address	-	ADR	Rx, "func"
//		Branch				-	BL
//				...
//		String				-	DCB	"func"
int find_strsig5(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
	uint32_t nm0 = *((uint32_t*)sig->ev_name);
	uint32_t *p;
	int j;

	for (p = fw->buf, j = 0; j < fw->size - nlen/4; j++, p++)
	{
		if ((nm0 == *p) && (memcmp(p+1,sig->ev_name+4,nlen-3) == 0))
		{
			uint32_t sadr = idx2adr(fw,j);        // string address
			int j1;
			uint32_t *p1;
			for (p1 = p-3, j1 = j-3; j1 >= 0; j1--, p1--)
			{
				if (((p1[1] & 0xFE0F0000) == 0xE20F0000) && // ADR ?
					((p1[2] & 0xFE000000) == 0xEA000000))   // B or BL ?
				{
					uint32_t padr = ADR2adr(fw,j1+1);
					if (padr == sadr)
					{
						int j2 = j1;
						int found = 0;
						if ((p1[0] & 0xFE1F0000) == 0xE41F0000) // LDR ?
							found = 1;
						else
						{
							uint32_t *p2;
							for (p2 = p1-2, j2 = j1-2; j2 >= 0 && j2 >= j1-4096; j2--, p2--)
							{
								if (((p2[0] & 0xFE1F0000) == 0xE41F0000) && // LDR ?
									((p2[1] & 0xFF000000) == 0xEA000000))   // B
								{
									uint32_t fa = idx2adr(fw,j2+1);
									fa = followBranch(fw,fa,1);
									if (adr2idx(fw,fa) == j1+1)
									{
										found = 1;
										break;
									}
								}
							}
						}
						if (found)
						{
							uint32_t fadr = fw->buf[LDR2idx(fw,j2)];
							if (sig->offset > 1) fadr = followBranch(fw, fadr, 1);
							fadr = followBranch2(fw, fadr, sig->offset);
							//fprintf(stderr,"%s %08x\n",curr_name,fadr);
							addMatch(fadr,32,0,k,105);
							return 1;
						}
					}
				}
			}
		}
	}

	return 0;
}

// Sig pattern:
//	Function immediately preceeding string
int find_strsig6(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
	uint32_t nm0 = *((uint32_t*)sig->ev_name);
	uint32_t *p;
	int j;
	
	for (p = fw->buf, j = 0; j < fw->size - nlen/4; j++, p++)
	{
		if ((nm0 == *p) && (memcmp(p+1,sig->ev_name+4,nlen-3) == 0))
		{
			int j1;
			uint32_t *p1;
			for (p1 = p-1, j1 = j-1; j1 >= 0; j1--, p1--)
			{
				if ((p1[0] & 0xFFFFF000) == 0xe92d4000)    // STMFD SP!, {..,LR}
				{
					uint32_t fadr = idx2adr(fw,j1);
					//fprintf(stderr,"%s %08x\n",curr_name,fadr);
					addMatch(fadr,32,0,k,106);
					return 1;
				}
			}
		}
	}

	return 0;
}

// Sig pattern:
//		Load Func Address	-	ADR	R3, func	- these four may occur in any order ?
//		Load String Address	-	ADR	R0, "func"	
//		Load value			-	MOV R2, x		
//		Load value			-	MOV R1, y		
//		Branch				-	BL
//				...
//		String				-	DCB	"func"
int find_strsig7(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
	uint32_t nm0 = *((uint32_t*)sig->ev_name);
	uint32_t *p;
	int j;
	
	for (p = fw->buf, j = 0; j < fw->size - nlen/4; j++, p++)
	{
		if ((nm0 == *p) && (memcmp(p+1,sig->ev_name+4,nlen-3) == 0))
		{
			uint32_t sadr = idx2adr(fw,j);        // string address
			int j1;
			uint32_t *p1;
			for (p1 = p-5, j1 = j-5; j1 >= 0; j1--, p1--)
			{
				if (((p1[0] & 0xFE000000) == 0xE2000000) && // ADR or MOV
					((p1[1] & 0xFE000000) == 0xE2000000) && // ADR or MOV
					((p1[2] & 0xFE000000) == 0xE2000000) && // ADR or MOV
					((p1[3] & 0xFE000000) == 0xE2000000) && // ADR or MOV
					((p1[4] & 0xFE000000) == 0xEA000000))   // B or BL ?
				{
					uint32_t padr;
					padr = ADR2adr(fw,j1+0);
					if (padr != sadr) padr = ADR2adr(fw,j1+1);
					if (padr != sadr) padr = ADR2adr(fw,j1+2);
					if (padr != sadr) padr = ADR2adr(fw,j1+3);
					if (padr == sadr)
					{
						uint32_t fadr = 0;
						if ((p1[0] & 0xFE0FF000) == 0xE20F3000)		 fadr = ADR2adr(fw,j1);		// R3 ?
						else if ((p1[1] & 0xFE0FF000) == 0xE20F3000) fadr = ADR2adr(fw,j1+1);	// R3 ?
						else if ((p1[2] & 0xFE0FF000) == 0xE20F3000) fadr = ADR2adr(fw,j1+2);	// R3 ?
						else if ((p1[3] & 0xFE0FF000) == 0xE20F3000) fadr = ADR2adr(fw,j1+3);	// R3 ?
						if (fadr != 0)
						{
							fadr = followBranch2(fw, fadr, sig->offset);
							//fprintf(stderr,"%s %08x\n",curr_name,fadr);
							addMatch(fadr,32,0,k,107);
							return 1;
						}
					}
				}
			}
		}
	}

	return 0;
}

// Sig pattern:
//		Special case for WriteSDCard
int find_strsig8(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
	uint32_t nm0 = *((uint32_t*)sig->ev_name);
	uint32_t *p;
	uint32_t fadr = 0;
	int srch = 20;

	// Find "UpdateMBROnFlash" code
	int j = get_saved_sig(fw,"UpdateMBROnFlash");
	if (j >= 0)
	{
		fadr = saved_sigs[j].val;
	}
	else
	{
		j = get_saved_sig(fw,"MakeSDCardBootable");
		if (j >= 0)
		{
			fadr = saved_sigs[j].val;
			srch = 32;
		}
	}
	
	if (fadr == 0) return 0;
	
	int idx = adr2idx(fw, fadr);
	int ofst = -1;
	
	for (j=idx+srch; j<idx+srch+12; j++)
	{
		if (isLDR(fw,j) && isLDR(fw,j+1) && isLDR(fw,j+2))
		{
			ofst = (fw->buf[j] & 0xfff) + (fw->buf[j+1] & 0xfff) + (fw->buf[j+2] & 0xfff);
			break;
		}
	}
	
	if (ofst == -1) return 0;
	
	for (p = fw->buf, j = 0; j < fw->size - nlen/4; j++, p++)
	{
		if ((nm0 == *p) && (memcmp(p+1,sig->ev_name+4,nlen-3) == 0))
		{
			int j1;
			for (j1=j-2; j1<j+8; j1++)
			{
				fadr = idx2adr(fw,j1);
				if (fw->buf[j1] >= fw->base)	// pointer ??
				{
					int j2;
					for (j2=j1-1; j2>=j1-1000 && j2>=0; j2--)
					{
						if (isLDR_PC(fw,j2) && (LDR2adr(fw,j2) == fadr))	// LDR ?
						{
							if ((isSTR(fw,j2+1) && ((fw->buf[j2+1] & 0xfff) == ofst)) ||	// STR ?
								(isSTR(fw,j2+2) && ((fw->buf[j2+2] & 0xfff) == ofst)))		// STR ?
							{
								fadr = fw->buf[j1];
								if (fadr >= fw->base)
								{
									//fprintf(stderr,"%s %08x\n",curr_name,fadr);
									addMatch(fadr,32,0,k,108);
									return 1;
								}
							}
						}
					}
				}
			}
		}
	}

	return 0;
}

// Sig pattern:
//		Func is B/BL @ offset from previous found func
//			prev_func
//				... (offset)
//				BL	func
int find_strsig9(firmware *fw, string_sig *sig, int k)
{
	int j = get_saved_sig(fw,sig->ev_name);
	if (j >= 0)
	{
		if (saved_sigs[j].val != 0)
		{			
			int ofst = dryos_offset(fw, sig);
			uint32_t fadr = followBranch(fw, saved_sigs[j].val+ofst*4, sig->offset);
			if ((sig->offset == 0) || (fadr != saved_sigs[j].val+ofst*4))
			{
				//fprintf(stderr,"%s %08x\n",curr_name,fadr);
				addMatch(fadr,32,0,k,109);
				return 1;
			}
		}
	}

	return 0;
}

// Sig pattern:
//		Load Func Address	-	LDR	R3, =func	- these four may occur in any order ?
//		Load String Address	-	ADR	R0, "func"	
//		Load value			-	MOV R2, x		
//		Load value			-	MOV R1, y		
//		Branch				-	BL
//				...
//		String				-	DCB	"func"
int find_strsig10(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
	uint32_t nm0 = *((uint32_t*)sig->ev_name);
	uint32_t *p;
	int j;
	
	for (p = fw->buf, j = 0; j < fw->size - nlen/4; j++, p++)
	{
		if ((nm0 == *p) && (memcmp(p+1,sig->ev_name+4,nlen-3) == 0))
		{
			uint32_t sadr = idx2adr(fw,j);        // string address
			int j1;
			uint32_t *p1;
			for (p1 = p-5, j1 = j-5; j1 >= 0; j1--, p1--)
			{
				if ((((p1[0] & 0xFE000000) == 0xE2000000) || ((p1[0] & 0xFE000000) == 0xE4000000)) && // LDR, ADR or MOV
					(((p1[1] & 0xFE000000) == 0xE2000000) || ((p1[1] & 0xFE000000) == 0xE4000000)) && // LDR, ADR or MOV
					(((p1[2] & 0xFE000000) == 0xE2000000) || ((p1[2] & 0xFE000000) == 0xE4000000)) && // LDR, ADR or MOV
					(((p1[3] & 0xFE000000) == 0xE2000000) || ((p1[3] & 0xFE000000) == 0xE4000000)) && // LDR, ADR or MOV
					((p1[4] & 0xFE000000) == 0xEA000000))   // B or BL ?
				{
					uint32_t padr;
					padr = ADR2adr(fw,j1+0);
					if (padr != sadr) padr = ADR2adr(fw,j1+1);
					if (padr != sadr) padr = ADR2adr(fw,j1+2);
					if (padr != sadr) padr = ADR2adr(fw,j1+3);
					if (padr == sadr)
					{
						uint32_t fadr = 0;
						if ((p1[0] & 0xFE0FF000) == 0xE40F3000)		 fadr = LDR2adr(fw,j1);		// R3 ?
						else if ((p1[1] & 0xFE0FF000) == 0xE40F3000) fadr = LDR2adr(fw,j1+1);	// R3 ?
						else if ((p1[2] & 0xFE0FF000) == 0xE40F3000) fadr = LDR2adr(fw,j1+2);	// R3 ?
						else if ((p1[3] & 0xFE0FF000) == 0xE40F3000) fadr = LDR2adr(fw,j1+3);	// R3 ?
						if (fadr != 0)
						{
							fadr = followBranch2(fw, fw->buf[adr2idx(fw,fadr)], sig->offset);
							//fprintf(stderr,"%s %08x\n",curr_name,fadr);
							addMatch(fadr,32,0,k,110);
							return 1;
						}
					}
				}
			}
		}
	}

	return 0;
}

// Sig pattern:
//		Func -			func
//			.... (offset)
//		Ref to string - 	ADR Rx, str
//			....
//		String - 			DCB "str"
int find_strsig11(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
	uint32_t nm0 = *((uint32_t*)sig->ev_name);
	uint32_t *p;
	int j;

	int ofst = dryos_offset(fw, sig);
	
	for (p = fw->buf, j = 0; j < fw->size - nlen/4; j++, p++)
	{
		if ((nm0 == *p) && (memcmp(p+1,sig->ev_name+4,nlen-4) == 0))
		{
			uint32_t sadr = idx2adr(fw,j);        // string address
			int j1;
			uint32_t *p1;
			for (p1 = p-1, j1 = j-1; j1 >= 0; j1--, p1--)
			{
				if ((p1[0] & 0x0E0F0000) == 0x020F0000) // ADR ?
				{
					uint32_t padr = ADR2adr(fw,j1);
					if (padr == sadr)
					{
						uint32_t fadr = idx2adr(fw,j1-ofst);
						uint32_t bfadr = followBranch(fw,fadr,sig->offset);
						// special case for 'set_control_event'
						int found = 0;
						if (strcmp(sig->name,"set_control_event") == 0)
						{
							uint32_t *p2 = p1 - ofst;
							if (((p2[0] & 0xFF000000) == 0xEB000000) &&		// BL
								((p2[1] & 0xFFFFF000) == 0xE59D0000) &&		// LDR R0,[SP,x]
								((p2[2] & 0xFF000000) == 0xEB000000) &&		// BL
								((p2[3] & 0xFFFFF000) == 0xE1A04000))		// LDR R4, R0
							{
								found = 1;
							}
						}
						else
							found = 1;
						if (found && ((sig->offset == 0) || (bfadr != fadr)))
						{
							//fprintf(stderr,"%s %08x\n",curr_name,fadr);
							addMatch(bfadr,32,0,k,111);
							return 1;
						}
					}
				}
			}
		}
	}

	return 0;
}

// Sig pattern:
//		Func is referenced in 'CreateJumptable'
//			LDR R1, =func
//			STR R1, [R0,nnn]
//		nnn - dryos version dependant offset
int find_strsig12(firmware *fw, string_sig *sig, int k)
{
	int j = get_saved_sig(fw,"CreateJumptable");	

	int ofst = dryos_offset(fw, sig);
	
	if (ofst == 0) return 0;
	
	if (j >= 0)
	{
		if (saved_sigs[j].val != 0)
		{
			int idx = adr2idx(fw, saved_sigs[j].val);
			for(; fw->buf[idx] != 0xE12FFF1E; idx++)	// BX LR
			{
				if (((fw->buf[idx+1] & 0xFFFFF000) == 0xE5801000) && // STR R1,[R0,nnn]
				    ((fw->buf[idx+1] & 0x00000FFF) == ofst))
				{
					uint32_t fadr = fw->buf[LDR2idx(fw,idx)];
					uint32_t bfadr = followBranch2(fw,fadr,sig->offset);
					if ((sig->offset <= 1) || ((bfadr != fadr) && ((fw->buf[adr2idx(fw,fadr)] & 0xFFFF0000) == 0xE92D0000)))
					{
						//fprintf(stderr,"%s %08x\n",curr_name,bfadr);
						addMatch(bfadr,32,0,k,112);
						return 1;
					}
				}
				else if ((fw->buf[idx] & 0xFF000000) == 0xEA000000)	// B
				{
					idx = adr2idx(fw,followBranch(fw,idx2adr(fw,idx),1)) - 1;
				}
			}
		}
	}

	return 0;
}

// Sig pattern:
//		Func -			func
//			... (offset)
//		Str ref -			LDR Rx, =str_ptr
//			...
//		Str ptr -			DCD str_ptr
//			...
//		Str ptr -		str_ptr
//							DCD str
//			...
//		String				DCB "str"
int find_strsig13(firmware *fw, string_sig *sig, int k)
{
    int nlen = strlen(sig->ev_name);
	char *p;
	int j;
	
	for (p = (char*)fw->buf, j = 0; j < fw->size*4 - nlen; j++, p++)
	{
		if (strncmp(sig->ev_name,(char*)p,nlen) == 0)
		{
			uint32_t sadr = fw->base + j;			// string address
			int j1;
			uint32_t *p1;
			for (p1 = &fw->buf[(j/4)-1], j1 = (j/4)-1; j1 >= 0; j1--, p1--)
			{
				if (p1[0] == sadr)    // string ptr
				{
					uint32_t padr = idx2adr(fw,j1);		// string ptr address
					int j2;
					uint32_t *p2;
					for (p2 = p1-1, j2 = j1-1; j2 >= 0; j2--, p2--)
					{
						if (p2[0] == padr)    // string ptr address
						{
							uint32_t ppadr = idx2adr(fw,j2);		// string ptr ptr address
							int j3;
							for (j3 = j2-1; j3 >= 0; j3--)
							{
								if (isLDR_PC(fw,j3) && (LDR2adr(fw,j3) == ppadr))
								{
									uint32_t fadr = idx2adr(fw,j3-sig->offset);
									//fprintf(stderr,"%s %08x\n",curr_name,fadr);
									addMatch(fadr,32,0,k,113);
									return 1;
								}
							}
						}
					}
				}
			}
		}
	}

	return 0;
}

// Sig pattern:
//		Special case for _pow
int find_strsig14(firmware *fw, string_sig *sig, int k)
{
	uint32_t *p;
	int j;
	
	for (p = fw->buf, j = 0; j < fw->size; j++, p++)
	{
		// Find values passed to _pow
		if ((p[0] == 0x00000000) && (p[1] == 0x40000000) && (p[2] == 0x00000000) && (p[3] == 0x408F4000))
		{
			uint32_t adr1 = idx2adr(fw,j);		// address of 1st value
			uint32_t adr2 = idx2adr(fw,j+2);	// address of 2nd value
			uint32_t *p1;
			int j1;
			
			for (p1 = p-5, j1 = j-5; j1>0; p1--, j1--)
			{
				if (((p1[0] & 0x0E0F0000) == 0x020F0000) &&	// ADR ?
					 (p1[1] == 0xE8900003) &&				// LDMIA R0,{R0,R1}
					((p1[2] & 0xFF000000) == 0xEB000000) &&	// BL
					((p1[4] & 0x0E0F0000) == 0x020F0000))	// ADR ?
				{
					if ((ADR2adr(fw,j1) == adr1) && (ADR2adr(fw,j1+4) == adr2))
					{
						uint32_t fadr = followBranch(fw,idx2adr(fw,j1+2),0x01000001);
						//fprintf(stderr,"%s %08x\n",curr_name,fadr);
						addMatch(fadr,32,0,k,114);
						return 1;
					}
				}
				else
				if (((p1[0] & 0x0E0F0000) == 0x020F0000) &&	// ADR ?
					 (p1[2] == 0xE8900003) &&				// LDMIA R0,{R0,R1}
					((p1[3] & 0xFF000000) == 0xEB000000) &&	// BL
					((p1[4] & 0x0E0F0000) == 0x020F0000))	// ADR ?
				{
					if ((ADR2adr(fw,j1) == adr1) && (ADR2adr(fw,j1+4) == adr2))
					{
						uint32_t fadr = followBranch(fw,idx2adr(fw,j1+3),0x01000001);
						//fprintf(stderr,"%s %08x\n",curr_name,fadr);
						addMatch(fadr,32,0,k,114);
						return 1;
					}
				}
			}
		}
	}
	
	return 0;
}

int find_strsig(firmware *fw, string_sig *sig, int k)
{
	switch (sig->type)
	{
		case 1:		return find_strsig1(fw, sig, k);
		case 2:		return find_strsig2(fw, sig, k);
		case 3:		return find_strsig3(fw, sig, k);
		case 4:		return find_strsig4(fw, sig, k);
		case 5:		return find_strsig5(fw, sig, k);
		case 6:		return find_strsig6(fw, sig, k);
		case 7:		return find_strsig7(fw, sig, k);
		case 8:		return find_strsig8(fw, sig, k);
		case 9:		return find_strsig9(fw, sig, k);
		case 10:	return find_strsig10(fw, sig, k);
		case 11:	return find_strsig11(fw, sig, k);
		case 12:	return find_strsig12(fw, sig, k);
		case 13:	return find_strsig13(fw, sig, k);
		case 14:	return find_strsig14(fw, sig, k);
	}
	
	return 0;
}

//------------------------------------------------------------------------------------------------------------

// Matching functions

void find_str_sig_matches(firmware *fw, const char *curr_name)
{
	int i;
	
	int found_ev = 0;
	int tried_ev = 0;

	count = 0;

	for (i = 0; string_sigs[i].ev_name != 0 && !found_ev; i++)
	{
		if (strcmp(curr_name, string_sigs[i].name) == 0)
		{
			tried_ev = 1;
			if (find_strsig(fw, &string_sigs[i], -1))
			{
				found_ev = 1;
				break;
			}
		}
	}

	if (count > 1)
	{
		//if (strcmp(curr_name,"GetDrive_FreeClusters") == 0) disp_sort = 1; else disp_sort = 0;
		qsort(matches, count, sizeof(Match), (void*)match_compare);
    }

	if (count > 0)
	{
		save_sig(curr_name, matches->ptr);	
	}
}

int find_matches(firmware *fw, int k)
{
    const char *curr_name;
    FuncSig *sig, *s;
    BufRange *n;
    uint32_t *p;
	int i;
    int fail, success;
	
	int found_ev = 0;
	int tried_ev = 0;

	count = 0;
    curr_name = func_list[k].name;

	while (1) {
		sig = func_list[k].sig;

		for (i = 0; string_sigs[i].ev_name != 0 && !found_ev; i++)
		{
			if (strcmp(curr_name, string_sigs[i].name) == 0)
			{
				tried_ev = 1;
				if (find_strsig(fw, &string_sigs[i], k))
				{
					found_ev = 1;
					break;
				}
			}
		}

		if (!found_ev)
		{
			for (n = fw->br; n != 0; n = n->next){
				for (p = n->p, i = 0; i < n->len; p++, i++){
					fail = 0;
					success = 0;
					for (s = sig; s->offs != -1; s++){
						if ((p[s->offs] & s->mask) != s->value){
							fail++;
						} else {
							success++;
						}
					}
					if (success > fail){
						if (s->mask == -2)
						{
							int end_branch = 0;
							uint32_t idx = 0;
							uint32_t *p1 = 0;
							if ((fw->buf[n->off+i+s->value] & 0x0F000000) == 0x0A000000)   // B
							{
								idx = adr2idx(fw, followBranch2(fw, idx2adr(fw,n->off+i+s->value), 0xF0000001));
								if ((idx >= 0) && (idx < fw->size))
								{
									end_branch = 1;
									p1 = &fw->buf[idx];
								}
							}
							int fail2 = 0;
							int success2 = 0;
							//fprintf(stderr,"\t%s %d %08x %08x %d %d\n",curr_name,idx,idx2adr(fw,idx),idx2adr(fw,i+n->off),success,fail);
							s++;
							for (; s->offs != -1; s++){
								if (!end_branch || (p1[s->offs] & s->mask) != s->value){
									fail2++;
								} else {
									success2++;
								}
							}
							if (fail2 == 0)
							{
								success = success + fail + success2;
								fail = 0;
							}
							else
							{
								success = success + success2;
								fail = fail + fail2;
							}
							//fprintf(stderr,"\t%s %d %08x %08x %d %d\n",curr_name,idx,idx2adr(fw,idx),idx2adr(fw,i+n->off),success,fail);
						}
					}
					if (success > fail){
						addMatch(idx2adr(fw,i+n->off),success,fail,k,func_list[k].ver);
						if (count >= MAX_MATCHES){
							bprintf("// WARNING: too many matches for %s!\n", func_list[k].name);
							break;
						}
					}
				}
			}
		}

		// same name, so we have another version of the same function
		if ((func_list[k+1].name == NULL) || (strcmp(curr_name, func_list[k+1].name) != 0)) {
			break;
		}
		k++;
	}

	if (count > 1)
	{
		//if (strcmp(curr_name,"GetDrive_FreeClusters") == 0) disp_sort = 1; else disp_sort = 0;
		qsort(matches, count, sizeof(Match), (void*)match_compare);
    }

	if (count > 0)
	{
		save_sig(curr_name, matches->ptr);	
	}
		
	return k;
}

void print_results(const char *curr_name)
{
	int i;
	int err = 0;
    char line[500] = "";
	
	// find best match and report results
#ifdef  COMP_OSTUBS
	osig* ostub = find_sig(stubs,curr_name);
#endif
	osig* ostub2 = find_sig(stubs2,curr_name);

	if ((count == 0)
		|| (matches->fail > 0)
		|| (ostub2 && (matches->ptr != ostub2->val))
#ifdef  COMP_OSTUBS
		|| (ostub && (matches->ptr != ostub->val) && (ostub->pct != 0) && (!ostub2 || (matches->ptr != ostub2->val)))
#endif
       )
		err = 1;

	// write to header (if error) or body buffer (no error)
	out_hdr = err;

	char *macro = "NSTUB";
	if (strncmp(curr_name,"task_",5) == 0) macro = "  DEF";
	
#if defined(UPDATE_STUBS2) && defined(COMP_OSTUBS)
    if (ostub && (count > 0) && (ostub->val != matches->ptr) && (ostub->pct != 0) && out_hdr && !ostub2)
    {
        static int hdr_added = 0;
        FILE *fp = fopen("stubs_entry_2.S","a");
        if (hdr_added == 0)
        {
            fprintf(fp,"\n\n// Added by finsig_dryos V2 to match old values found by finsig.\n");
            fprintf(fp,"// Values should be checked in firmware, if the new address in stubs_entry.S\n// is correct then delete the correspoding entry below.\n");
            hdr_added = 1;
        }
        fprintf(fp,"NHSTUB(%-30s,0x%08x) // New address = 0x%08x\n",curr_name,ostub->val,matches->ptr);
        fclose(fp);

        ostub2 = malloc(sizeof(osig));
        strcpy(ostub2->nm, curr_name);
        ostub2->val = ostub->val;
    }
#endif

	if (count == 0)
	{
		int opt = is_in_list(curr_name,optional);
		if (opt == 1) return;
		char fmt[50] = "";
		sprintf(fmt, "// ERROR: %%s is not found. %%%ds//--- --- ", 34-strlen(curr_name));
		sprintf(line+strlen(line), fmt, curr_name, "");
	}
	else
	{
		if (ostub2)
		    sprintf(line+strlen(line),"//%s(%-38s,0x%08x) //%3d ", macro, curr_name, matches->ptr, matches->sig);
		else
			sprintf(line+strlen(line),"%s(%-40s,0x%08x) //%3d ", macro, curr_name, matches->ptr, matches->sig);

		if (matches->fail > 0)
			sprintf(line+strlen(line),"%2d%% ", matches->success*100/(matches->success+matches->fail));
		else
			sprintf(line+strlen(line),"    ");
	}

	if (ostub2)
	{
		if ((count > 0) && (matches->ptr == ostub2->val))
			sprintf(line+strlen(line),"       == 0x%08x    ",ostub2->val);
		else
			sprintf(line+strlen(line),"   *** != 0x%08x    ",ostub2->val);
	}
	else
		sprintf(line+strlen(line),"                        ");

#ifdef  COMP_OSTUBS
	if (ostub)
	{
		if ((count > 0) && (ostub->val != matches->ptr) && (ostub->pct != 0))
		{
			if (out_hdr)
				sprintf(line+strlen(line),"  *** != 0x%08x @ %3d%%",ostub->val,ostub->pct);
			else
				sprintf(line+strlen(line),"      != 0x%08x @ %3d%%",ostub->val,ostub->pct);
		}
		else if ((ostub->pct != 0) && (ostub->pct != 100))
		{
			sprintf(line+strlen(line),"      == 0x%08x @ %3d%%",ostub->val,ostub->pct);
		}
		else if (ostub->pct == 0)
		{
			sprintf(line+strlen(line),"          Not Found");
		}
	}
#endif

    for (i=strlen(line)-1; i>=0 && line[i]==' '; i--) line[i] = 0;
    bprintf("%s\n",line);

	for (i=1;i<count && matches[i].fail==matches[0].fail;i++)
	{
		if (matches[i].ptr != matches->ptr)
		{
			bprintf("// ALT: %s(%s, 0x%x) // %d %d/%d\n", macro, curr_name, matches[i].ptr, matches[i].sig, matches[i].success, matches[i].fail);
		}
	}
}

//------------------------------------------------------------------------------------------------------------

int find_str_ref(firmware *fw, char *str)
{
	int k = find_str(fw, str);
	if (k >= 0)
	{
		uint32_t sadr = idx2adr(fw,k);		// string address
		for (k=0; k<fw->size; k++)
		{
			if (((fw->buf[k] & 0x0E0F0000) == 0x020F0000) && // ADR ?
				(ADR2adr(fw,k) == sadr))
			{
				return k;
			}
		}
	}
	return -1;
}

//------------------------------------------------------------------------------------------------------------

typedef struct
{
	uint16_t mode;
	char *nm;
} ModeMapName;

ModeMapName mmnames[] = {
	{ 32768,"MODE_AUTO" },
	{ 32769,"MODE_M" },
	{ 32770,"MODE_AV" },
	{ 32771,"MODE_TV" },
	{ 32772,"MODE_P" },
	
	{ 65535,"" }
};

char* mode_name(uint16_t v)
{
	int i;
	for (i=0; mmnames[i].mode != 65535; i++)
	{
		if (mmnames[i].mode == v)
			return mmnames[i].nm;
	}
	
	return "";
}

void find_modemap(firmware *fw)
{
	int k,k1,cnt = 0;
	
	out_hdr = 1;
	add_blankline();

	bprintf("// Check of modemap from 'platform/CAMERA/shooting.c':\n");

	k = find_str_ref(fw, "AC:PTM_Init");
	if (k >= 0)
	{
		bprintf("// Firmware modemap table found @%08x -> ",idx2adr(fw,k));
		if (isBL(fw,k+2))
		{
			k = idxFollowBranch(fw,k+2,0x01000001);
			bprintf("%08x -> ",idx2adr(fw,k));
			for (k1 = 22; k1 <= 26; k1++)
			{
				if (isBL(fw,k+k1))
				{
					k = idxFollowBranch(fw,k+k1,0x01000001);
					bprintf("%08x -> ",idx2adr(fw,k));
					for (k1 = 37; k1 <= 41; k1++)
					{
						if (isBL(fw,k+k1))
						{
							k = idxFollowBranch(fw,k+k1,0x01000001);
							bprintf("%08x -> ",idx2adr(fw,k));
							if (isLDR_PC(fw,k))
							{
								k = adr2idx(fw,fw->buf[LDR2idx(fw,k)]);
								bprintf("%08x\n",idx2adr(fw,k));
								uint16_t *p = (uint16_t*)(&fw->buf[k]);
								k = 0;
								while ((*p != 0xFFFF) && (k < 50))
								{
									if (((fw->dryos_ver < 49) && ((*p < 8000) || (*p > 8999))) || ((fw->dryos_ver == 49) && ((*p < 4000) || (*p > 4999))))
									{
										osig *m = find_sig_val(modemap, *p);
										if (!m)
										{
											char *s = mode_name(*p);
											bprintf("// Mode %5d in firmware but not in current modemap",*p);
											if (strcmp(s,"") != 0)
												bprintf(" (%s)",s);
											bprintf("\n");
											cnt++;
										}
										else
										{
											m->pct = 100;
										}
									}
									p++;
									k++;
								}
							}
							osig *m = modemap;
							while (m)
							{
								if (m->pct != 100)	// not matched above?
								{
									bprintf("// Current modemap entry not found in firmware - %-24s %5d\n",m->nm,m->val);
									cnt++;
								}
								m = m->nxt;
							}
							if (cnt == 0)
							{
								bprintf("// No problems found with modemap table.\n");
							}
							return;
						}
					}
				}
			}
		}
		bprintf("\n");
	}
}

//------------------------------------------------------------------------------------------------------------

uint32_t craw_bufsize = 0;

// Search for things that go in 'platform_camera.h'
void find_platform_vals(firmware *fw)
{
	int k,k1;
	
	out_hdr = 1;
	add_blankline();

	bprintf("// Values below go in 'platform_camera.h':\n");
	bprintf("//#define CAM_DRYOS         1\n");
	if (fw->dryos_ver >= 39)
		bprintf("//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher\n");
	if (fw->dryos_ver >= 47)
		bprintf("//#define CAM_DRYOS_2_3_R47 1 // Defined for cameras with DryOS version R47 or higher\n");

	// Find 'RAW' image size
	uint32_t raw_width = 0;
	uint32_t raw_height = 0;
	uint32_t kw=0, kh=0;
	
	k = find_str_ref(fw, "\r[%ld] AdjDrvType[%02ld] -> DrvType[%02");
	if (k >= 0)
	{
		for (k1 = k-1; k1 >= k-20; k1--)
		{
			if ((fw->buf[k1] & 0x0FFF0FFF) == 0x058D0030)			// STRxx Rn, [SP,#0x30]
			{
				if ((fw->buf[k1-1] & 0x0FFF0000) == 0x03A00000)		// MOVxx Rn, #YYY
				{
					raw_height = ALUop2(fw, k1-1);
					kh = k1-1;
				}
				else if ((fw->buf[k1-2] & 0x0FFF0000) == 0x03A00000)// MOVxx Rn, #YYY
				{
					raw_height = ALUop2(fw, k1-2);
					kh = k1-2;
				}
				else if (isLDR_PC_cond(fw,k1-1))
				{
					raw_height = fw->buf[LDR2idx(fw,k1-1)];
					kh = k1-1;
				}
				else if (isLDR_PC_cond(fw,k1-2))
				{
					raw_height = fw->buf[LDR2idx(fw,k1-2)];
					kh = k1-2;
				}
			}
			if ((fw->buf[k1] & 0x0FFF0FFF) == 0x058D0034)			// STRxx Rn, [SP,#0x34]
			{
				if ((fw->buf[k1-1] & 0x0FFF0000) == 0x03A00000)		// MOVxx Rn, #YYY
				{
					raw_width = ALUop2(fw, k1-1);
					kw = k1-1;
				}
				else if ((fw->buf[k1-2] & 0x0FFF0000) == 0x03A00000)// MOVxx Rn, #YYY
				{
					raw_width = ALUop2(fw, k1-2);
					kw = k1-2;
				}
				else if (isLDR_PC_cond(fw,k1-1))
				{
					raw_width = fw->buf[LDR2idx(fw,k1-1)];
					kw = k1-1;
				}
				else if (isLDR_PC_cond(fw,k1-2))
				{
					raw_width = fw->buf[LDR2idx(fw,k1-2)];
					kw = k1-2;
				}
			}
		}
	}

	if ((raw_width == 0) && (raw_height == 0))
	{
		k = find_str_ref(fw, " CrwAddress %lx, CrwSize H %ld V %ld\r");
		if (k >= 0)
		{
			// Width
			for (k1=k-1; k1>=k-5; k1--)
			{
				if ((fw->buf[k1] & 0xFFFFF000) == 0xE3A02000)	// MOV R2, #nnn
				{
					raw_width = ALUop2(fw,k1);
					kw = k1;
				}
				else
				if (isLDR_PC(fw,k1) && ((fw->buf[k1]& 0x0000F000) == 0x00002000))	// LDR R2, =nnn
				{
					raw_width = fw->buf[LDR2idx(fw,k1)];
					kw = k1;
				}
			}
			// Height
			for (k1=k-1; k1>=k-5; k1--)
			{
				if ((fw->buf[k1] & 0xFFFFF000) == 0xE3A03000)	// MOV R3, #nnn
				{
					raw_height = ALUop2(fw,k1);
					kh = k1;
				}
				else
				if (isLDR_PC(fw,k1) && ((fw->buf[k1]& 0x0000F000) == 0x00003000))	// LDR R3, =nnn
				{
					raw_height = fw->buf[LDR2idx(fw,k1)];
					kh = k1;
				}
				else
				if ((fw->buf[k1] & 0xFFFFF000) == 0xE2423000)	// SUB R3, R2, #nnn
				{
					raw_height = raw_width - ALUop2(fw,k1);
					kh = k1;
				}
			}
		}
	}
	
	if (raw_width != 0)
	{
		bprintf("//#define CAM_RAW_ROWPIX    %d // Found @0x%08x\n",raw_width,idx2adr(fw,kw));
	}
	if (raw_height != 0)
	{
		bprintf("//#define CAM_RAW_ROWS      %d // Found @0x%08x\n",raw_height,idx2adr(fw,kh));
	}

	// Find 'CAM_UNCACHED_BIT'
	k = get_saved_sig(fw, "FreeUncacheableMemory");
	if (k >= 0)
	{
		uint32_t fadr = saved_sigs[k].val;
		int idx = adr2idx(fw, fadr);
		
		for (k=idx; k<idx+8; k++)
		{
			if ((fw->buf[k] & 0x0FFFF000) == 0x03C00000)	// BIC
			{
				fadr = ALUop2(fw,k);
				bprintf("//#undef  CAM_UNCACHED_BIT\n");
				bprintf("//#define CAM_UNCACHED_BIT  0x%08x // Found @0x%08x\n",fadr,idx2adr(fw,k));
			}
		}
	}
}

//------------------------------------------------------------------------------------------------------------

// Search for things that go in 'lib.c'
void find_lib_vals(firmware *fw)
{
	int k,k1;
	
	out_hdr = 1;
	add_blankline();

	bprintf("// Values below go in 'lib.c':\n");

	// Find 'vid_get_bitmap_fb'
	k = get_saved_sig(fw, "DispCon_ShowBitmapColorBar");
	if (k >= 0)
	{
		uint32_t fadr = saved_sigs[k].val;
		int idx = adr2idx(fw, fadr);
		
		for (k=idx+1; k<idx+30; k++)
		{
			if (((fw->buf[k-1] & 0xFF000000) == 0xEB000000)	&& // BL
			    (isLDR_PC(fw,k)))
			{
				uint32_t v1 = fw->buf[LDR2idx(fw,k)];
				bprintf("//void *vid_get_bitmap_fb()        { return (void*)0x%08x; } // Found @0x%08x\n",v1,idx2adr(fw,k));
				break;
			}
			else
			if (((fw->buf[k-1] & 0xFF000000) == 0xEB000000)	&& // BL
			    (isLDR_PC(fw,k+1)))
			{
				uint32_t v1 = fw->buf[LDR2idx(fw,k+1)];
				bprintf("//void *vid_get_bitmap_fb()        { return (void*)0x%08x; } // Found @0x%08x\n",v1,idx2adr(fw,k));
				break;
			}
		}
	}
	
	// find 'vid_get_viewport_fb'
	k = find_str_ref(fw, "VRAM Address  : %p\r");
	if (k >= 0)
	{
		for (k1=k-1; k1>k-8; k1--)
		{
			if (isLDR(fw,k1) && isLDR(fw,k1+1))
			{
				uint32_t v1 = fw->buf[LDR2idx(fw,k1)];
				uint32_t v2 = fw->buf[LDR2idx(fw,k1+1)];
				if (v2 > v1) v1 = v2;
				bprintf("//void *vid_get_viewport_fb()      { return (void*)0x%08x; } // Found @0x%08x\n",v1,idx2adr(fw,k1));
			}
		}
	}
	
	// find 'camera_jpeg_count_str'
	k = find_str_ref(fw, "9999");
	if (k >= 0)
	{
		if (isLDR(fw,k-1) && ((fw->buf[k+1] & 0xFF000000) == 0xEB000000))
		{
			uint32_t v1 = fw->buf[LDR2idx(fw,k-1)];
			bprintf("//char *camera_jpeg_count_str()    { return (char*)0x%08x; } // Found @0x%08x\n",v1,idx2adr(fw,k-1));
		}
	}
	
	// find 'hook_raw_size'
	k = find_str_ref(fw, "CRAW BUFF SIZE  %p");
	if (k >= 0)
	{
		if (isLDR(fw,k-1))
		{
			craw_bufsize = fw->buf[LDR2idx(fw,k-1)];
			bprintf("//long hook_raw_size()             { return 0x%08x; }        // Found @0x%08x\n",craw_bufsize,idx2adr(fw,k-1));
		}
	}
	
	// Find value for 'get_flash_params_count'
	k = get_saved_sig(fw, "GetParameterData");
	if (k >= 0)
	{
		uint32_t fadr = saved_sigs[k].val;
		int idx = adr2idx(fw, fadr);
		
		for (k=idx; k<idx+30; k++)
		{
			if ((fw->buf[k] & 0xFFF00FFF) == 0xE3C00901)	// BIC Rn, Rn, #0x4000
			{
				uint32_t r = fw->buf[k] & 0x000F0000;	// Register
				if (((fw->buf[k+1] & 0xFFF00000) == 0xE3500000) && ((fw->buf[k+1] & 0x000F0000) == r))	// CMP, Rn #val
				{
					bprintf("//int get_flash_params_count(void) { return 0x%02x; }              // Found @0x%08x\n",fw->buf[k+1]&0xFFF,idx2adr(fw,k+1));
					break;
				}
			}
		}
	}
}

//------------------------------------------------------------------------------------------------------------

void print_stubs_min(firmware *fw, const char *name, uint32_t fadr, uint32_t atadr)
{
	osig *o = find_sig(stubs_min,name);
	bprintf("//DEF(%-40s,0x%08x) // Found @0x%08x",name,fadr,atadr);
	if (o)
	{
		if (fadr != o->val)
		{
			bprintf(", ** != ** stubs_min = 0x%08x (%s)",o->val,o->sval);
		}
		else
		{
			bprintf(",          stubs_min = 0x%08x (%s)",o->val,o->sval);
		}
	}
	bprintf("\n");
}

// Search for things that go in 'stubs_min.S'
void find_stubs_min(firmware *fw)
{
	int k,k1;
	
	out_hdr = 1;
	add_blankline();

	bprintf("// Values below go in 'stubs_min.S':\n");

	// Find 'physw_status'
	k = get_saved_sig(fw, "kbd_read_keys");
	if (k >= 0)
	{
		uint32_t fadr = saved_sigs[k].val;
		int idx = adr2idx(fw, fadr);
		
		for (k=0; k<5; k++)
		{
			if (isLDR_PC(fw,idx+k))
			{
				print_stubs_min(fw,"physw_status",fw->buf[LDR2idx(fw,idx+k)],idx2adr(fw,idx+k));
				//break;
			}
		}
	}
	
	// Find 'physw_run'
	k = get_saved_sig(fw, "task_PhySw");
	if (k >= 0)
	{
		uint32_t fadr = saved_sigs[k].val;
		int idx = adr2idx(fw, fadr);
		
		for (k=0; k<5; k++)
		{
			if (isLDR_PC(fw,idx+k))
			{
				uint32_t base = fw->buf[LDR2idx(fw,idx+k)];
				uint32_t fadr = followBranch(fw, idx2adr(fw,idx+k+1), 1);
				uint32_t ofst = fw->buf[adr2idx(fw,fadr)] & 0x00000FFF;
				print_stubs_min(fw,"physw_run",base+ofst,idx2adr(fw,idx+k));
				//break;
			}
		}
	}
	
	// Find 'levent_table'
	for (k=0; k<fw->size; k++)
	{
		if ((fw->buf[k] > fw->base) && (fw->buf[k+1] == 0x00000800) && (fw->buf[k+2] == 0x00000002))
		{
			print_stubs_min(fw,"levent_table",idx2adr(fw,k),idx2adr(fw,k));
			//break;
		}
	}
	
	// Find 'FlashParamsTable'
	for (k=0; k<fw->size; k++)
	{
		if ((fw->buf[k] > fw->base) && (fw->buf[k+1] == 0x00010000) && (fw->buf[k+2] == 0xFFFF0002))
		{
			uint32_t fadr = idx2adr(fw,k);
			for (k1=0; k1<fw->size; k1++)
			{
				if (fw->buf[k1] == fadr)
				{
					print_stubs_min(fw,"FlashParamsTable",idx2adr(fw,k1),idx2adr(fw,k1));
					k = fw->size;
					//break;
				}
			}
		}
	}
	
	// Find 'movie_status'
	for (k=0; k<fw->size; k++)
	{
		if (isLDR_PC(fw, k) &&								// LDR R0, =base
			((fw->buf[k+1] & 0xFE0F0000) == 0xE20F0000) &&	// ADR R1, =sub
			isSTR(fw, k+2) &&								// STR R1, [R0,N]
			(fw->buf[k+3] == 0xE3A01003) &&					// MOV R1, 3
			isSTR(fw, k+4) &&								// STR R1, [R0,ofst]
			(fw->buf[LDR2idx(fw,k)] < fw->base))
		{
			uint32_t base = fw->buf[LDR2idx(fw,k)];
			uint32_t ofst = fw->buf[k+4] & 0x00000FFF;
			print_stubs_min(fw,"movie_status",base+ofst,idx2adr(fw,k));
			//break;
		}
		else
		if (isLDR_PC(fw, k) &&								// LDR R1, =sub
			isLDR_PC(fw, k+1) &&							// LDR R0, =base
			isSTR(fw, k+2) &&								// STR R1, [R0,N]
			(fw->buf[k+3] == 0xE3A01003) &&					// MOV R1, 3
			isSTR(fw, k+4) &&								// STR R1, [R0,ofst]
			(fw->buf[LDR2idx(fw,k+1)] < fw->base))
		{
			uint32_t base = fw->buf[LDR2idx(fw,k+1)];
			uint32_t ofst = fw->buf[k+4] & 0x00000FFF;
			print_stubs_min(fw,"movie_status",base+ofst,idx2adr(fw,k));
			//break;
		}
	}
	
	// Find 'full_screen_refresh'
	for (k=0; k<fw->size; k++)
	{
		if (((fw->buf[k] & 0xFF1FF000) == 0xE51F0000) &&	// LDR R0, =base
			(fw->buf[k+1] == 0xE5D01000) &&					// LDRB R1, [R0]
			(fw->buf[k+2] == 0xE3811002) &&					// ORR R1, R1, #2
			(fw->buf[k+3] == 0xE5C01000) &&					// STRB R1, [R0]
			(fw->buf[k+4] == 0xE12FFF1E))					// BX LR
		{
			uint32_t base = fw->buf[LDR2idx(fw,k)];
			print_stubs_min(fw,"full_screen_refresh",base,idx2adr(fw,k));
			//break;
		}
	}
	
	// Find 'canon_menu_active'
	k = get_saved_sig(fw, "StartRecModeMenu");
	if (k >= 0)
	{
		uint32_t fadr = saved_sigs[k].val;
		int idx = adr2idx(fw, fadr);
		
		for (k=0; k<5; k++)
		{
			if (isLDR_PC(fw,idx+k))
			{
				uint32_t base = fw->buf[LDR2idx(fw,idx+k)];
				for (k1=k+1; k1<k+5; k1++)
				{
					if (isLDR(fw,idx+k1))
					{
						uint32_t ofst = fw->buf[idx+k1] & 0x00000FFF;
						print_stubs_min(fw,"canon_menu_active",base+ofst,idx2adr(fw,idx+k));
						//break;
					}
				}
			}
		}
	}
	
	// Find 'canon_shoot_menu_active'
	for (k=0; k<fw->size; k++)
	{
		if (((fw->buf[k]   & 0xFF1FF000) == 0xE51F1000) &&	// LDR R1, =base
			((fw->buf[k+1] & 0xFFFFF000) == 0xE5D10000) &&	// LDRB R0, [R1, #n]
			(fw->buf[k+2] == 0xE2800001) &&					// ADD R0, R0, #1
			((fw->buf[k+3] & 0xFFFFF000) == 0xE5C10000) &&	// STRB R0, [R1, #n]
			((fw->buf[k+4] & 0xFF000000) == 0xEA000000))	// B
		{
			uint32_t base = fw->buf[LDR2idx(fw,k)];
			uint32_t ofst = fw->buf[k+1] & 0x00000FFF;
			print_stubs_min(fw,"canon_shoot_menu_active",base+ofst,idx2adr(fw,k));
			//break;
		}
		else
		if (((fw->buf[k]   & 0xFF1FF000) == 0xE51F0000) &&	// LDR R0, =base
			((fw->buf[k+1] & 0xFFFFF000) == 0xE5D01000) &&	// LDRB R1, [R0, #n]
			(fw->buf[k+2] == 0xE2811001) &&					// ADD R1, R1, #1
			((fw->buf[k+3] & 0xFFFFF000) == 0xE5C01000) &&	// STRB R1, [R0, #n]
			((fw->buf[k+4] & 0xFF000000) == 0xEA000000))	// B
		{
			uint32_t base = fw->buf[LDR2idx(fw,k)];
			uint32_t ofst = fw->buf[k+1] & 0x00000FFF;
			print_stubs_min(fw,"canon_shoot_menu_active",base+ofst,idx2adr(fw,k));
			//break;
		}
	}
	
	// Find 'playrec_mode'
	int found_playrec_mode = 0;
	k = find_str_ref(fw, "AFFChg");
	if ((k >= 0) && isBL(fw,k+6))
	{
		k = idxFollowBranch(fw, k+6, 0x01000001);
		if (isLDR_PC(fw,k) && isLDR(fw,k+1))
		{
			uint32_t base = fw->buf[LDR2idx(fw,k)];
			uint32_t ofst = fw->buf[k+1] & 0x00000FFF;
			print_stubs_min(fw,"playrec_mode",base+ofst,idx2adr(fw,k));
			found_playrec_mode = 1;
		}
	}
	if (!found_playrec_mode)
	{
		for (k=0; k<fw->size; k++)
		{
			if (((fw->buf[k]    & 0xFF1FF000) == 0xE51F1000) &&	// LDR R1, =base
				((fw->buf[k+1]  & 0xFFFFF000) == 0xE5810000) &&	// STR R0, [R1, #n]
				((fw->buf[k+3]  & 0xFF1FF000) == 0xE51F0000) &&	// LDR R0, =base
				((fw->buf[k+4]  & 0xFFFFF000) == 0xE5900000) &&	// LDR R0, [R0, #n]
				((fw->buf[k+6]  & 0xFF1FF000) == 0xE51F1000) &&	// LDR R1, =base
				((fw->buf[k+9]  & 0xFF1FF000) == 0xE51F0000) &&	// LDR R0, =base
				((fw->buf[k+12] & 0xFF1FF000) == 0xE51F1000) &&	// LDR R1, =base
				((fw->buf[k+15] & 0xFF1FF000) == 0xE51F0000) &&	// LDR R0, =base
				((fw->buf[k+18] & 0xFF1FF000) == 0xE51F1000) &&	// LDR R1, =base
				(fw->buf[LDR2idx(fw,k)] == fw->buf[LDR2idx(fw,k+3)]) &&
				(fw->buf[LDR2idx(fw,k)] == fw->buf[LDR2idx(fw,k+6)]) &&
				(fw->buf[LDR2idx(fw,k)] == fw->buf[LDR2idx(fw,k+9)]) &&
				(fw->buf[LDR2idx(fw,k)] == fw->buf[LDR2idx(fw,k+12)]) &&
				(fw->buf[LDR2idx(fw,k)] == fw->buf[LDR2idx(fw,k+15)]) &&
				(fw->buf[LDR2idx(fw,k)] == fw->buf[LDR2idx(fw,k+18)]))
			{
				uint32_t base = fw->buf[LDR2idx(fw,k)];
				uint32_t ofst = fw->buf[k+1] & 0x00000FFF;
				print_stubs_min(fw,"playrec_mode",base+ofst,idx2adr(fw,k));
				found_playrec_mode = 1;
				//break;
			}
		}
	}
	
	// Find 'zoom_status'
	int found_zoom_status = 0;
	
	k = find_str_ref(fw, "m_ZoomState            :%d\n");
	if (k >= 0)
	{
		if (isLDR(fw,k-1))
		{
			uint32_t ofst = fw->buf[k-1] & 0x00000FFF;
			uint32_t reg = (fw->buf[k-1] & 0x000F0000) >> 16;
			uint32_t ldr_inst = 0xE51F0000 | (reg << 12);
			for (k1=k-2; k1>k-20; k1--)
			{
				if ((fw->buf[k1] & 0xFF1FF000) == ldr_inst)
				{
					uint32_t base = fw->buf[LDR2idx(fw,k1)];
					print_stubs_min(fw,"zoom_status",base+ofst,idx2adr(fw,k));
					found_zoom_status = 1;
					break;
				}
			}
		}
	}
	
	if (!found_zoom_status)
	{
		for (k=0; k<fw->size; k++)
		{
			if (((fw->buf[k] & 0xFF1FF000) == 0xE51F0000) &&	// LDR R0, =base
				(fw->buf[k+1] == 0xE5D00000) &&					// LDRB R0, [R0]
				(fw->buf[k+2] == 0xE1B00000) &&					// MOVS R0, R0
				(fw->buf[k+3] == 0x13A00001) &&					// MOVNE R0, #1
				(fw->buf[k+4] == 0xE12FFF1E))					// BX LR
			{
				uint32_t base = fw->buf[LDR2idx(fw,k)];
				print_stubs_min(fw,"zoom_status",base,idx2adr(fw,k));
				found_zoom_status = 1;
				//break;
			}
		}
	}
	
	if (!found_zoom_status)
	{
		k = find_str_ref(fw, "TerminateDeliverToZoomController");
		if (k >= 0)
		{
			for (k1=0; k1<5; k1++)
			{
				if (isLDR_PC(fw,k+k1))
				{
					uint32_t base = fw->buf[LDR2idx(fw,k+k1)];
					print_stubs_min(fw,"zoom_status",base+0x20,idx2adr(fw,k+k1));
					found_zoom_status = 1;
					break;
				}
			}
		}
	}
	
	// Find 'some_flag_for_af_scan'
	for (k=0; k<fw->size; k++)
	{
		if (((fw->buf[k]    & 0xFF000000) == 0xEA000000) &&	// B loc
			((fw->buf[k+1]  & 0xFF000000) == 0xEA000000) &&	// B loc
			((fw->buf[k+2]  & 0xFF000000) == 0xEA000000) &&	// B loc
			((fw->buf[k+3]  & 0xFF000000) == 0xEA000000) &&	// B loc
			((fw->buf[k+4]  & 0xFF000000) == 0xEA000000) &&	// B loc
			((fw->buf[k+5]  & 0xFF000000) == 0xEA000000) &&	// B loc
			((fw->buf[k+6]  & 0xFF000000) == 0xEA000000) &&	// B loc
			((fw->buf[k+7]  & 0xFF000000) == 0xEA000000) &&	// B loc
			(followBranch(fw,idx2adr(fw,k),1) != followBranch(fw,idx2adr(fw,k+1),1)) &&
			(followBranch(fw,idx2adr(fw,k),1) == followBranch(fw,idx2adr(fw,k+2),1)) &&
			(followBranch(fw,idx2adr(fw,k),1) == followBranch(fw,idx2adr(fw,k+3),1)) &&
			(followBranch(fw,idx2adr(fw,k),1) != followBranch(fw,idx2adr(fw,k+4),1)) &&
			(followBranch(fw,idx2adr(fw,k),1) != followBranch(fw,idx2adr(fw,k+5),1)) &&
			(followBranch(fw,idx2adr(fw,k),1) == followBranch(fw,idx2adr(fw,k+6),1)) &&
			(followBranch(fw,idx2adr(fw,k),1) == followBranch(fw,idx2adr(fw,k+7),1)) &&
			(isLDR_PC(fw,adr2idx(fw,followBranch(fw,idx2adr(fw,k),1)))))	// LDR R0, =base
		{
			uint32_t base = fw->buf[LDR2idx(fw,adr2idx(fw,followBranch(fw,idx2adr(fw,k),1)))];
			print_stubs_min(fw,"some_flag_for_af_scan",base,followBranch(fw,idx2adr(fw,k),1));
			//break;
		}
	}
}

//------------------------------------------------------------------------------------------------------------

void print_kval(firmware *fw, uint32_t tadr, int tsiz, int tlen, uint32_t ev, const char *name, char *sfx)
{
	int tidx = adr2idx(fw,tadr);
	int k, kval = 0;
	for (k=0; k<tlen; k+=tsiz)
	{
		if (fw->buf[tidx+k+1] == ev)
		{
			kval = fw->buf[tidx+k];
			tadr = idx2adr(fw,tidx+k);
			break;
		}
	}
	if (kval > 0)
	{
		char fn[100], rn[100];
		strcpy(fn,name); strcat(fn,sfx);
		strcpy(rn,name); strcat(rn,"_IDX");
		
		int r = (kval >> 5) & 7;
		uint32_t b = (1 << (kval & 0x1F));
		
		bprintf("//#define %-20s0x%08x // Found @0x%08x, levent 0x%x\n",fn,b,tadr,ev);
		bprintf("//#define %-20s%d\n",rn,r);
	}
}

typedef struct {
	int			reg;
	uint32_t	bits;
	char		nm[32];
	uint32_t	fadr;
	uint32_t	ev;
} kinfo;

int		kmask[3];
kinfo	key_info[100];
int		kcount = 0;

void add_kinfo(int r, uint32_t b, const char *nm, uint32_t adr, uint32_t ev)
{
	key_info[kcount].reg = r;
	key_info[kcount].bits = b;
	strcpy(key_info[kcount].nm, nm);
	key_info[kcount].fadr = adr;
	key_info[kcount].ev = ev;
	kcount++;
	kmask[r] |= b;
}

uint32_t add_kmval(firmware *fw, uint32_t tadr, int tsiz, int tlen, uint32_t ev, const char *name, uint32_t xtra)
{
	int tidx = adr2idx(fw,tadr);
	int r, k, kval = 0;
	uint32_t b = 0;
	for (k=0; k<tlen; k+=tsiz)
	{
		if (fw->buf[tidx+k+1] == ev)
		{
			kval = fw->buf[tidx+k];
			tadr = idx2adr(fw,tidx+k);
			break;
		}
	}
	if (kval > 0)
	{
		r = (kval >> 5) & 7;
		b = (1 << (kval & 0x1F));
		
		add_kinfo(r,b|xtra,name,tadr,ev);
	}
	
	return b;
}

int kinfo_compare(const kinfo *p1, const kinfo *p2)
{
    if (p1->reg > p2->reg)
	{
		return 1;
    }
	else if (p1->reg < p2->reg)
	{
		return -1;
    }
	if (p1->ev <= 1)	// output shutter entries in reverse order
	{
		if (p1->bits > p2->bits)
		{
			return -1;
		}
		else if (p1->bits < p2->bits)
		{
			return 1;
		}
	}
    if (p1->bits > p2->bits)
	{
        return 1;
    }
	else if (p1->bits < p2->bits)
	{
        return -1;
    }

    return 0;
}

void print_kmvals()
{
	qsort(key_info, kcount, sizeof(kinfo), (void*)kinfo_compare);
	
	bprintf("//static KeyMap keymap[] = {\n");
	
	int k;
	for (k=0; k<kcount; k++)
	{
		bprintf("//    { %d, %-20s,0x%08x }, // Found @0x%08x, levent 0x%02x\n",key_info[k].reg,key_info[k].nm,key_info[k].bits,key_info[k].fadr,key_info[k].ev);
	}
	
	bprintf("//    { 0, 0, 0 }\n//};\n");
}

void find_key_vals(firmware *fw)
{
	int k,k1;
	
	out_hdr = 1;
	add_blankline();

	// find 'SD_READONLY_FLAG'
	uint32_t tadr = 0;
	k = get_saved_sig(fw, "GetSDProtect");
	if (k >= 0)
	{
		uint32_t fadr = saved_sigs[k].val;
		k = adr2idx(fw,fadr);
		if ((fw->buf[k+1] & 0xFF000000) == 0xEA000000)	// B
		{
			fadr = followBranch(fw,fadr+4,1);
			k1 = adr2idx(fw,fadr);
			if (isLDR_PC(fw,k1))
			{
				tadr = fw->buf[LDR2idx(fw,k1)];
			}
		}
	}
	if (tadr == 0)
	{
		k = find_str_ref(fw,"SD Not Exist\n");
		if (k >= 0)
		{
			for (k1=k-1; k1>k-5; k1--)
			{
				if ((fw->buf[k1] & 0xFF000000) == 0xEB000000)	// BL
				{
					uint32_t fadr = followBranch(fw,idx2adr(fw,k1),0x01000001);
					int k2 = adr2idx(fw,fadr);
					if (isLDR_PC(fw,k2))
					{
						tadr = fw->buf[LDR2idx(fw,k2)];
					}
				}
			}
		}
	}
	if (tadr != 0)
	{
		int tsiz = 2;
		if (fw->buf[adr2idx(fw,tadr)+2] == 0) tsiz = 3;
		
		uint32_t madr = fw->base + (fw->size*4-4);
		for (k=0; k<(tadr-fw->base)/4; k++)
		{
			if (isLDR_PC(fw,k))
			{
				uint32_t adr = fw->buf[LDR2idx(fw,k)];
				if ((adr > tadr) && (adr < madr))
				{
					madr = adr;
				}
			}
		}
		int tlen = (madr - tadr) / 4;
		if (tsiz == 2)
		{
			k1 = adr2idx(fw,tadr);
			for (k=0; k<tlen/3; k+=3)
			{
				if ((fw->buf[k1+k+1] == 0xFFFFFFFF) && (fw->buf[k1+k+4] == 0xFFFFFFFF))
				{
					tsiz = 3;
					break;
				}
			}
		}
		if (tlen > 50*tsiz) tlen = 50*tsiz;
		
		bprintf("// Bitmap masks and physw_status index values for SD_READONLY and USB power flags (for kbd.c).\n");
        if (fw->dryos_ver == 49)
        {
            // Event ID's have changed in DryOS R49 **********
    		print_kval(fw,tadr,tsiz,tlen,0x20A,"SD_READONLY","_FLAG");
	    	print_kval(fw,tadr,tsiz,tlen,0x202,"USB","_MASK");
        }
        else
        {
    		print_kval(fw,tadr,tsiz,tlen,0x90A,"SD_READONLY","_FLAG");
	    	print_kval(fw,tadr,tsiz,tlen,0x902,"USB","_MASK");
        }
				
		uint32_t key_half = add_kmval(fw,tadr,tsiz,tlen,0,"KEY_SHOOT_HALF",0);
		add_kmval(fw,tadr,tsiz,tlen,1,"KEY_SHOOT_FULL",key_half);
		add_kmval(fw,tadr,tsiz,tlen,1,"KEY_SHOOT_FULL_ONLY",0);
		add_kmval(fw,tadr,tsiz,tlen,2,"KEY_ZOOM_IN",0);
		add_kmval(fw,tadr,tsiz,tlen,3,"KEY_ZOOM_OUT",0);
		add_kmval(fw,tadr,tsiz,tlen,4,"KEY_UP",0);
		add_kmval(fw,tadr,tsiz,tlen,5,"KEY_DOWN",0);
		add_kmval(fw,tadr,tsiz,tlen,6,"KEY_LEFT",0);
		add_kmval(fw,tadr,tsiz,tlen,7,"KEY_RIGHT",0);
		add_kmval(fw,tadr,tsiz,tlen,8,"KEY_SET",0);
		add_kmval(fw,tadr,tsiz,tlen,9,"KEY_MENU",0);
		add_kmval(fw,tadr,tsiz,tlen,0xA,"KEY_DISPLAY",0);
				
		bprintf("\n// Keymap values for kbd.c. Additional keys may be present, only common values included here.\n");
		print_kmvals();
	}
}

//------------------------------------------------------------------------------------------------------------

int main(int argc, char **argv)
{
    firmware fw;
    int k;
    int ret = 0;
    const char *curr_name;

    clock_t t1 = clock();

    if (argc != 3)
        usage("args");

    //load_ignore_list();

#ifdef  COMP_OSTUBS
    load_stubs();
    //print_stubs(stubs);
#endif
    load_stubs2();
    //print_stubs(stubs2);
	load_stubs_min();
    //print_stubs(stubs_min);
	load_modemap();
    //print_stubs(modemap);
	
    bprintf("// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!\n");
    bprintf("#include \"stubs_asm.h\"\n\n");

    load_firmware(&fw,argv[1],argv[2]);
	
    // Find all the valid ranges for checking (skips over large blocks of 0xFFFFFFFF)
    findRanges(&fw);

#ifdef  COMP_OSTUBS
	out_hdr = 1;
	bprintf("// Stubs below should be checked. Stub not matched 100%%, or difference\n");
	bprintf("// found to current 'stubs_entry_2.S' or original 'stubs_entry.S'\n");
	bprintf("//    Name                                     Address      Rule  %%  Comp to stubs_entry_2.S  Comp to stubs_entry.S.orig\n");
	out_hdr = 0;
	bprintf("// Stubs below matched 100%%.\n");
	bprintf("//    Name                                     Address                Comp to stubs_entry_2.S  Comp to stubs_entry.S.orig\n");
#else
	out_hdr = 1;
	bprintf("// Stubs below should be checked. Stub not matched 100%%, or difference found to current 'stubs_entry_2.S'\n");
	bprintf("//    Name                                     Address      Rule  %%  Comp to stubs_entry_2.S\n");
	out_hdr = 0;
	bprintf("// Stubs below matched 100%%.\n");
	bprintf("//    Name                                     Address                Comp to stubs_entry_2.S\n");
#endif

    for (k = 0; func_list[k].name; k++){

        count = 0;
        curr_name = func_list[k].name;

        int ignore = is_in_list(curr_name,ignore_list);

        if (!ignore)
        {
			k = find_matches(&fw, k);

			if ((fw.dryos_ver >= find_min_ver(curr_name)) && (fw.dryos_ver <= find_max_ver(curr_name)))
				print_results(curr_name);

			if (count == 0)
			{
				ret = 1;
			}
        }
    }

    clock_t t2 = clock();

	find_modemap(&fw);
	find_stubs_min(&fw);
	find_lib_vals(&fw);
	find_key_vals(&fw);
	find_platform_vals(&fw);

    fprintf(stderr,"Time to generate stubs %.2f seconds\n",(double)(t2-t1)/(double)CLOCKS_PER_SEC);
	
	write_output();
	
    return ret;
}

//------------------------------------------------------------------------------------------------------------
