#############################################################################
# File		: Makefile
# Package	: rpmlint
# Author	: Frederic Lepied
# Created on	: Mon Sep 30 13:20:18 1999
# Version	: $Id$
# Purpose	: rules to manage the files.
#############################################################################

BINDIR=/usr/bin
LIBDIR=/usr/share/rpmlint
FILES= rpmlint *.py INSTALL README COPYING ChangeLog Makefile

all:
	python -O rpmlint.py -C . /dev/null

clean:
	rm -f *~ *.pyc *.pyo

install:
	-mkdir -p $(DESTDIR)$(LIBDIR) $(DESTDIR)$(BINDIR)
	cp -p *.py *.pyo $(DESTDIR)$(LIBDIR)
	cp rpmlint $(DESTDIR)$(BINDIR)

dist:
	VERSION=`python rpmlint.py -V|sed -e 's/rpmlint version //' -e 's/ Copyright (C) 1999 Frederic Lepied//'`; \
	rm -f rpmlint-$$VERSION.tar.bz2; \
	mkdir rpmlint-$$VERSION; \
	ln $(FILES) rpmlint-$$VERSION/; \
	tar cvf rpmlint-$$VERSION.tar rpmlint-$$VERSION;\
	bzip2 -9vf rpmlint-$$VERSION.tar;\
	rm -rf rpmlint-$$VERSION

# Makefile ends here
