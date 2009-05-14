# How many threads should be used when doing parallel testing (and
# sometime in the future, parallel building)?
NUM_THREADS=20

all:
	cd spkg && ./install all 2>&1 | tee -a ../install.log

clean:
	echo "Deleted spkg/build"
	rm -rf spkg/build
	mkdir -p spkg/build
	echo "Deleted spkg/archive"
	rm -rf spkg/archive
	mkdir -p spkg/archive

distclean:
	make clean
	rm -rf local
	rm -rf spkg/installed/*
	rm -f install.log
	rm -f test.log
	rm -rf data
	rm -rf dist
	rm -rf devel
	rm -rf doc
	rm -rf examples
	rm -rf sage-python 
	rm -rf spkg/build
	rm -rf spkg/archive
	rm -rf ipython
	rm -rf matplotlib
	rm -rf tmp

test:   all
	. local/bin/sage-env && sage-starts && sage-maketest

check:  all
	. local/bin/sage-env && sage-starts && sage-maketest

testoptional: all
	./sage -b
	. local/bin/sage-env && sage-starts && ./sage -t -optional devel/sage/doc/common devel/sage/doc/en devel/sage/doc/fr devel/sage/sage 2>&1 | tee -a testall.log

testlong:   all
	./sage -b
	. local/bin/sage-env && sage-starts && ./sage -t -long devel/sage/doc/common devel/sage/doc/en devel/sage/doc/fr devel/sage/sage 2>&1 | tee -a testlong.log

ptest:  all
	. local/bin/sage-env && sage-starts && ./sage -tp $(NUM_THREADS) devel/sage/doc/common devel/sage/doc/en devel/sage/doc/fr devel/sage/sage/ 2>&1 | tee -a ptest.log

ptestall:  all
	. local/bin/sage-env && sage-starts && ./sage -tp $(NUM_THREADS) -optional devel/sage/doc/common devel/sage/doc/en devel/sage/doc/fr devel/sage/sage/ 2>&1 | tee -a ptest.log

ptestlong: all
	. local/bin/sage-env && sage-starts && ./sage -tp $(NUM_THREADS) -long devel/sage/doc/common devel/sage/doc/en devel/sage/doc/fr devel/sage/sage/ 2>&1 | tee -a ptestlong.log

install:
	echo "Experimental use only!"
	if [ "$(DESTDIR)" = "" ]; then \
		echo "Set DESTDIR"; \
		exit 1; \
	fi 
	mkdir -p $(DESTDIR)
	mkdir -p $(DESTDIR)/sage
	mkdir -p $(DESTDIR)/bin/
	cp -rpv * $(DESTDIR)/sage/
	python local/bin/sage-hardcode_sage_root $(DESTDIR)/sage/sage "$(DESTDIR)"/sage
	cp $(DESTDIR)/sage/sage $(DESTDIR)/bin/
	cd $(DESTDIR)/bin/; ./sage -c

#base:
#	cd spkg && ./install base 2>&1 | tee -a ../install.log

####################
# useful shortcuts #
####################

gmp:	
	./sage -i gmp


