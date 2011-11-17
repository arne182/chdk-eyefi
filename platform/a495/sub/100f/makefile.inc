#PLATFORMID=0x31EF
PLATFORMID=12783

PLATFORMOS=dryos

# address where wif or diskboot code will be loaded by camera, ROM:FFC00134
MEMBASEADDR=0x1900

# size of memory region for CHDK
RESTARTSTART=0x50000

# ROM:FFC0014C
MEMISOSTART=0x128E90

# Base address 0xFFC00000 for A
ROMBASEADDR=0xFFC00000


PLFLAGS=-DMEMBASEADDR=$(MEMBASEADDR) -DMEMISOSTART=$(MEMISOSTART) -DMEMISOSIZE=$(MEMISOSIZE)
PLFLAGS+=-DRESTARTSTART=$(RESTARTSTART)

# type of diskboot encoding: undefined = none; 1 = original; 2 = sx200, d10; 3 = ixus200...
# Dancing Bits
NEED_ENCODED_DISKBOOT=4

# FIR (requires correct keys in platform/fi2.inc)
KEYSYS=d4a
