
// Dancing bits data for encoding diskboot.bin file
// Used by dancingbits.c and finsig_dryos.c

#define VITALY 7
unsigned char _chr_[VITALY][8] = {
									{ 4,6,1,0,7,2,5,3 }, // original flavor
									{ 5,3,6,1,2,7,0,4 }, // nacho cheese sx200is, ixus100_sd780, ixu95_sd1200, a1100, d10
									{ 2,5,0,4,6,1,3,7 }, // mesquite bbq ixus200_sd980, sx20 (dryos r39)
									{ 4,7,3,2,6,5,0,1 }, // cool ranch a3100 (dryos r43)
									{ 3,2,7,5,1,4,6,0 }, // cajun chicken s95, g12, sx30 (dryos r45)
									{ 0,4,2,7,3,6,5,1 }, // spicy wasabi sx220, sx230, ixus310 (dryos r47)
									{ 7,1,5,3,0,6,4,2 }, // sea salt & vinegar sx40hs, sx150is (dryos r49)
								};

