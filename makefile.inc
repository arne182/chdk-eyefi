VER=CHDK

MEMISOSIZE="(&_end-&_start)"
# override this on the command line or in buildconf to use PRIMARY.BIN from a different tree
# should be an absolute path
PRIMARY_ROOT=$(topdir)platform
include $(topdir)buildconf.inc
# optional local version of buildconf.inc, not in SVN so it can be used in autobuilds
# and to avoid getting accidentally included in svn diffs
# you may also set your default camera here
-include $(topdir)localbuildconf.inc
include $(topdir)version.inc

ifdef PLATFORM
  ifdef PLATFORMSUB
    include $(topdir)platform/$(PLATFORM)/sub/$(PLATFORMSUB)/makefile.inc
  endif
endif

# Used in gui_debug.c for controlling memory browser allowed address ranges
# override in platform/$(PLATFORM)/sub/$(PLATFORMSUB)/makefile.inc to set camera specific value
ifdef MAXRAMADDR
PLFLAGS+=-DMAXRAMADDR=$(MAXRAMADDR)
else
PLFLAGS+=-DMAXRAMADDR=0x2000000
endif
ifdef ROMBASEADDR
PLFLAGS+=-DROMBASEADDR=$(ROMBASEADDR)
else
PLFLAGS+=-DROMBASEADDR=0xFFC00000
endif

ifdef OPT_FI2
include $(topdir)platform/fi2.inc
endif

SILENT=SILENT

NOZERO100K=TRUE

##########################################################################
##########################################################################
##########################################################################

ESED = sed -r

# keep sort order consistent
export LC_ALL=C

ifndef OSTYPE
  HOSTPLATFORM:=$(patsubst MINGW%,MINGW,$(shell uname -s))
  ifeq ($(HOSTPLATFORM),MINGW)
	OSTYPE = Windows
	EXE = .exe
	SH = sh
	DEVNULL = NUL
	OLDSEPARATOR = \\\\
	NEWSEPARATOR = /
	SORT := $(dir $(shell which uniq.exe | sed 's_$(OLDSEPARATOR)_$(NEWSEPARATOR)_g'))/sort.exe
  else
    ifeq ($(HOSTPLATFORM),Linux)
      OSTYPE = Linux
      EXE =
      SH =
      DEVNULL = /dev/null
      SORT = sort
    else
      ifeq ($(HOSTPLATFORM),Darwin)
        OSTYPE = Darwin
        EXE =
        SH =
        DEVNULL = /dev/null
        SORT = sort
        ESED = sed -E
      else
        OSTYPE = Other
        EXE =
        SH =
        DEVNULL = /dev/null
        SORT = sort
      endif
    endif
  endif
else
  EXE =
  SH =
  DEVNULL = /dev/null
  SORT = sort
endif

##########################################################################
##########################################################################
##########################################################################

HOSTCC=gcc
HOSTCFLAGS=-g -O2 -Wall
HOSTAR=ar

PAKWIF=$(topdir)tools/pakwif$(EXE)
PAKFI2=$(topdir)tools/packfi2/fi2enc$(EXE)
ENCODE_DISKBOOT=$(topdir)tools/dancingbits$(EXE)

##########################################################################

CC=arm-elf-gcc
OBJCOPY=arm-elf-objcopy
OBJDUMP=arm-elf-objdump
STRIP=arm-elf-strip
NM=arm-elf-nm
AR=arm-elf-ar
RANLIB=arm-elf-ranlib
SIZE=arm-elf-size

GCC_VERSION=$(shell $(CC) -dumpversion)
GCC_VERSION_MAJOR=$(firstword $(subst ., ,$(GCC_VERSION)))

# -msoft-float is used per default but object files are marked as hard-float
CFLAGS=-fno-inline -Os -fno-strict-aliasing
# flags for gcc v4
# CFLAGS+=-mcpu=arm946e-s
# for gcc v3, we use to allow use of strd etc
ifeq ($(GCC_VERSION_MAJOR),3)
    CFLAGS+=-march=armv5te
else
    ifeq ($(GCC_VERSION_MAJOR),4)
        # TODO should be -mcpu, but breaks things ATM
        CFLAGS+=-mtune=arm946e-s
    endif
endif


CTHUMB=-mthumb
CFLAGS+=-mthumb-interwork
CFLAGS+=-I$(topdir)include -I$(topdir)platform/$(PLATFORM) $(PLFLAGS) $(CPPFLAGS)
CFLAGS+=-DPLATFORM=\"$(PLATFORM)\" -DPLATFORMSUB=\"$(PLATFORMSUB)\" -DPLATFORMID=$(PLATFORMID) -DHDK_VERSION=\"$(VER)\" -DBUILD_NUMBER=\"$(BUILD_NUMBER)\" -DCAMERA_$(PLATFORM)=1
CFLAGS+=-Wall -Wno-unused -Wno-format
LDFLAGS=-L$(topdir)lib/math -L$(topdir)lib/font
LDFLAGS+=-L$(topdir)lib/libc -L$(topdir)lib/ubasic
LDFLAGS+=-L$(topdir)platform/$(PLATFORM) -L$(topdir)platform/$(PLATFORM)/sub/$(PLATFORMSUB)

ifdef OPT_DEBUGGING
CFLAGS+=-DOPT_DEBUGGING
endif

ifdef OPT_PTP
CFLAGS+=-DOPT_PTP
endif

ifdef OPT_LUA
CFLAGS+=-DOPT_LUA
OPT_SCRIPTING=1
endif

ifdef OPT_UBASIC
CFLAGS+=-DOPT_UBASIC
OPT_SCRIPTING=1
endif

ifdef OPT_SCRIPTING
CFLAGS+=-DOPT_SCRIPTING
endif

ifdef OPT_EXMEM_MALLOC
CFLAGS+=-DOPT_EXMEM_MALLOC
endif

ifdef OPT_EXMEM_TESTING
CFLAGS+=-DOPT_EXMEM_TESTING
endif

ifdef EXMEM_HEAP_SKIP
CFLAGS+=-DEXMEM_HEAP_SKIP=$(EXMEM_HEAP_SKIP)
endif

ifdef EXMEM_BUFFER_SIZE
CFLAGS+=-DEXMEM_BUFFER_SIZE=$(EXMEM_BUFFER_SIZE)
endif

ifdef OPT_CHDK_IN_EXMEM
CFLAGS+=-DOPT_CHDK_IN_EXMEM
endif

ifdef OPT_WARNINGS
     ifeq ($(GCC_VERSION_MAJOR),3)
           CFLAGS+=-Wwrite-strings -Wsign-compare -Wunused -Wno-unused-parameter
           HOSTCFLAGS+=-Wwrite-strings -Wsign-compare -Wunused -Wno-unused-parameter
     endif
     ifeq ($(GCC_VERSION_MAJOR),4)
           CFLAGS+=-Wextra -fdiagnostics-show-option -Wno-missing-field-initializers -Wunused -Wno-unused-parameter
           #HOSTCFLAGS+=-Wextra -fdiagnostics-show-option -Wno-missing-field-initializers -Wunused -Wno-unused-parameter
     endif
endif

##########################################################################

.PHONY: default
default: all

ifndef SKIPBUILDRULES

%.o: %.c
	@echo $< \-\> $@
	$(CC) $(CFLAGS) -nostdinc -c -o $@ $<
%.o: %.S
	@echo $< \-\> $@
	$(CC) $(CFLAGS) -nostdinc -c -o $@ $<
%.a:
	@echo $^ \-\> $@
	$(AR) rcs $@ $^

.dep/%.d: %.c .dep
	$(CC) $(CFLAGS) -M $< > $@.$$$$; \
		sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

.dep/%.d: %.S .dep
	$(CC) $(CFLAGS) -M $< > $@.$$$$; \
		sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
		rm -f $@.$$$$

endif

.PHONY: all
all: all-recursive

.PHONY: clean
clean: clean-recursive

.PHONY: distclean
distclean: distclean-recursive

.dep:
	mkdir .dep

clean-recursive:
	@for i in $(SUBDIRS); do \
		echo \>\> Cleaning in $(FOLDER)$$i; \
		$(MAKE) -C $$i FOLDER="$(FOLDER)$$i/" clean || exit 1; \
	done

distclean-recursive:
	@for i in $(SUBDIRS); do \
		echo \>\> Distcleaning in $(FOLDER)$$i; \
		$(MAKE) -C $$i FOLDER="$(FOLDER)$$i/" distclean || exit 1; \
	done

all-recursive:
ifndef PLATFORM
	$(error PLATFORM has not been defined. Specify the PLATFORM to build on the command line or in localbuildconf.inc)
endif
ifndef PLATFORMSUB
	$(error PLATFORMSUB has not been defined. Specify the PLATFORMSUB to build on the command line or in localbuildconf.inc)
endif
	@for i in $(SUBDIRS); do \
		echo \>\> Entering to $(FOLDER)$$i; \
		$(MAKE) -C $$i FOLDER="$(FOLDER)$$i/" || exit 1; \
		echo \<\< Leaving $(FOLDER)$$i; \
	done

depend-recursive:
	@for i in $(SUBDIRS); do \
		echo \>\> Entering to $(FOLDER)$$i; \
		$(MAKE) -C $$i FOLDER="$(FOLDER)$$i/" depend || exit 1; \
		echo \<\< Leaving $(FOLDER)$$i; \
	done

ifdef SILENT
.SILENT:
endif


# Define empty recipes for source files (including the makefiles)
# to prevent make from trying implicit rules to create them. Speeds up build process
Makefile: ;
makefile: ;
$(topdir)makefile.inc: ;
$(topdir)buildconf.inc: ;
$(topdir)localbuildconf.inc: ;
$(topdir)version.inc: ;
$(topdir)platform/$(PLATFORM)/sub/$(PLATFORMSUB)/makefile.inc: ;
$(topdir)platform/fi2.inc: ;
*.c: ;
*.txt: ;
*.sh: ;
reversebytes.S: ;
callfunc.S: ;
setjmp.S: ;
stubs_min.S: ;
stubs_entry_2.S: ;
