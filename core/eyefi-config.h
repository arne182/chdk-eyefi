#ifndef _EYEFI_CONFIG_H
#define _EYEFI_CONFIG_H

#ifdef PLAIN
#include <sys/types.h>
#else
#define __LITTLE_ENDIAN
 typedef unsigned long size_teye;
#endif


/*
 * Do some kernel-style types to make
 * definitions shorter.
 */
typedef unsigned long u32;
typedef unsigned char u8;

#define os_memset memset
#define os_memcpy memcpy
#define os_strlen strlen
#define os_strcpy strcpy

#define SHA1_MAC_LEN 20
#define MD5_MAC_LEN 16
void sha1_vector(size_teye num_elem, const u8 *addr[], const size_teye *len, u8 *mac);
void md5_vector(size_teye num_elem, const u8 *addr[], const size_teye *len, u8 *mac);
void hmac_md5_vector(const u8 *key, size_teye key_len, size_teye num_elem,
		     const u8 *addr[], const size_teye *len, u8 *mac);
void hmac_md5(const u8 *key, size_teye key_len, const u8 *data, size_teye data_len,
	      u8 *mac);
void pbkdf2_sha1(const char *passphrase, const char *ssid, size_teye ssid_len,
		 int iterations, u8 *buf, size_teye buflen);

static inline u32 swap_bytes(u32 src)
{
        u32 dest = 0;
        dest |= (src & 0xff000000) >> 24;
        dest |= (src & 0x00ff0000) >>  8;
        dest |= (src & 0x0000ff00) <<  8;
        dest |= (src & 0x000000ff) << 24;
        return dest;
}

#ifdef __LITTLE_ENDIAN
#warning le
#define le_to_host32(n) (n)
#define be_to_host32(n) swap_bytes(n)
#define host_to_be32(n) swap_bytes(n)
#else  // __BIG_ENDIAN
#warning be
#define le_to_host32(n) swap_bytes(n)
#define be_to_host32(n) (n)
#define host_to_be32(n) (n)
#endif

char *net_type_name(u8 type);

#define ESSID_LEN 32
struct scanned_net {
	char essid[ESSID_LEN];
	u8 strength;
	u8 type;
} __attribute__((packed));

struct scanned_net_list {
	u8 nr;
	struct scanned_net nets[100];
} __attribute__((packed));

char *net_type_name(u8 type);
struct scanned_net_list *scan_nets(void);

#endif // _EYEFI_CONFIG_H
