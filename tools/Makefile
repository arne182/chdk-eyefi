topdir=../

SKIPBUILDRULES=1

include $(topdir)makefile.inc

OBJS=pakwif.o finsig_$(PLATFORMOS).o gensig_$(PLATFORMOS).o dumpchk.o dancingbits.o rawconvert.o dumputil.o find_levent.o find_eventproc.o yuvconvert.o font_8x16_pack.o makelang.o

ifdef OPT_FI2
  SUBDIRS=packfi2
endif

all: pakwif$(EXE) finsig_$(PLATFORMOS)$(EXE) dancingbits$(EXE) font_8x16_pack$(EXE) makelang$(EXE)

# not needed by batch builds, not built by default
extras: rawconvert$(EXE) yuvconvert$(EXE) find_levent$(EXE) find_eventproc$(EXE) dumpchk$(EXE)

%.o: %.c
	@echo $< \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -DPLATFORMOS_$(PLATFORMOS) -c -o $@ $<

.dep/%.d: %.c .dep
	$(HOSTCC) $(HOSTCFLAGS) -MM $< > $@.$$$$; \
	    sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	    rm -f $@.$$$$

pakwif$(EXE): pakwif.o
	@echo $< \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

finsig_$(PLATFORMOS)$(EXE): finsig_$(PLATFORMOS).o
	@echo $< \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

gensig_$(PLATFORMOS)$(EXE): gensig_$(PLATFORMOS).o
	@echo $< \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

dumpchk$(EXE): dumpchk.o
	@echo $< \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

dancingbits$(EXE): dancingbits.o
	@echo $< \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

rawconvert$(EXE): rawconvert.o
	@echo $< \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

yuvconvert$(EXE): yuvconvert.o
	@echo $< \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

find_levent$(EXE): find_levent.o dumputil.o
	@echo $^ \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

find_eventproc$(EXE): find_eventproc.o dumputil.o
	@echo $^ \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

font_8x16_pack$(EXE): font_8x16_pack.o
	@echo $^ \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

makelang$(EXE): makelang.o
	@echo $^ \-\> $@
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^

clean:
	rm -f pakwif$(EXE) $(OBJS)
#	if [ -s sig_ref_vxworks_1.bin ] && [ -s sig_ref_vxworks_2.bin ] && [ -s sig_ref_vxworks_3.bin ] ; then \
#	  rm -f signatures_vxworks.h ; \
#	fi
#	if [ -s sig_ref_dryos_1.bin ] ; then \
#	  rm -f signatures_dryos.h ; \
#	fi

distclean: clean
#	rm -f signatures.h


signatures_vxworks.h: gensig_vxworks$(EXE) gensigs_vxworks.sh sig_ref_vxworks_1.txt sig_ref_vxworks_1.bin sig_ref_vxworks_2.txt sig_ref_vxworks_2.bin sig_ref_vxworks_3.txt sig_ref_vxworks_3.bin
	@echo \-\> $@
ifdef OPT_GEN_SIGS
	if [ -s sig_ref_vxworks_1.bin ] && [ -s sig_ref_vxworks_2.bin ] && [ -s sig_ref_vxworks_3.bin ] ; then \
	  $(SH) ./gensigs_vxworks.sh $(SORT) vxworks "1 2 3" > signatures_vxworks.h ; \
	else \
	  echo CAUTION! \'signatures_vxworks.h\' is not updated due to \'sig_ref_vxworks_1.bin\` or \'sig_ref_vxworks_2.bin\` or \'sig_ref_vxworks_3.bin\` is empty! ; \
	  touch signatures_vxworks.h ; \
	fi
else
	echo CAUTION! Signature generation is turned off! ; \
	touch signatures_vxworks.h
endif

signatures_dryos.h: gensig_dryos$(EXE) gensigs_dryos.sh sig_ref_dryos_1.txt sig_ref_dryos_1.bin sig_ref_dryos_2.txt sig_ref_dryos_2.bin sig_ref_dryos_3.txt sig_ref_dryos_3.bin sig_ref_dryos_4.txt sig_ref_dryos_4.bin sig_ref_dryos_5.txt sig_ref_dryos_5.bin sig_ref_dryos_6.txt sig_ref_dryos_6.bin sig_ref_dryos_7.txt sig_ref_dryos_7.bin sig_ref_dryos_8.txt sig_ref_dryos_8.bin sig_ref_dryos_9.txt sig_ref_dryos_9.bin sig_ref_dryos_10.txt sig_ref_dryos_10.bin
	@echo \-\> $@
ifdef OPT_GEN_SIGS
	if [ -s sig_ref_dryos_1.bin ] && [ -s sig_ref_dryos_2.bin ] && [ -s sig_ref_dryos_3.bin ] && [ -s sig_ref_dryos_4.bin ] && [ -s sig_ref_dryos_5.bin ] && [ -s sig_ref_dryos_6.bin ] && [ -s sig_ref_dryos_7.bin ] && [ -s sig_ref_dryos_8.bin ] && [ -s sig_ref_dryos_9.bin ] && [ -s sig_ref_dryos_10.bin ] ; then \
	  $(SH) ./gensigs_dryos.sh $(SORT) dryos "1 2 3 4 5 6 7 8 9 10" > signatures_dryos.h ; \
	else \
	  echo CAUTION! \'signatures_dryos.h\' is not updated due to \'sig_ref_dryos_?.bin\` is empty! ; \
	  touch signatures_dryos.h ; \
	fi
else
	echo CAUTION! Signature generation is turned off! ; \
	touch signatures_dryos.h
endif

sig_ref_vxworks_1.bin:
	touch sig_ref_vxworks_1.bin

sig_ref_vxworks_2.bin:
	touch sig_ref_vxworks_2.bin

sig_ref_vxworks_3.bin:
	touch sig_ref_vxworks_3.bin

sig_ref_dryos_1.bin:
	touch sig_ref_dryos_1.bin

sig_ref_dryos_2.bin:
	touch sig_ref_dryos_2.bin

sig_ref_dryos_3.bin:
	touch sig_ref_dryos_3.bin

sig_ref_dryos_4.bin:
	touch sig_ref_dryos_4.bin

sig_ref_dryos_5.bin:
	touch sig_ref_dryos_5.bin

sig_ref_dryos_6.bin:
	touch sig_ref_dryos_6.bin

sig_ref_dryos_7.bin:
	touch sig_ref_dryos_7.bin

sig_ref_dryos_8.bin:
	touch sig_ref_dryos_8.bin

sig_ref_dryos_9.bin:
	touch sig_ref_dryos_9.bin

sig_ref_dryos_10.bin:
	touch sig_ref_dryos_10.bin

finsig_$(PLATFORMOS).o: finsig_$(PLATFORMOS).c signatures_$(PLATFORMOS).h

font_8x16_pack.o: font_8x16_pack.c ../lib/font/font_8x16_uni.h

include $(topdir)bottom.inc

