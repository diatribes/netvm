.SILENT:

all: clean build check distcheck

#####
## CARL_EXIT_BIN := src/carl-exit/carl-exit

CARL_EXIT_BIN := ../carl-exit/carl-exit
CARL_EXIT_CP := carl-exit

.PHONY: $(CARL_EXIT_BIN) 

$(CARL_EXIT_BIN):
	set -xe; $(MAKE) -C ../carl-exit $(CARL_EXIT_CP)

./$(CARL_EXIT_CP): $(CARL_EXIT_BIN)
	cp $(CARL_EXIT_BIN) $(CARL_EXIT_CP)
	file $(CARL_EXIT_CP)

#####
## check build: $(DUMB_INIT_BIN)

DUMB_INIT_BIN := ../dumb-init/dumb-init
DUMB_INIT_CP := dumb-init

.PHONY: $(DUMB_INIT_BIN)

$(DUMB_INIT_BIN):
	set -xe; $(MAKE) -C ../dumb-init $(DUMB_INIT_CP)

./$(DUMB_INIT_CP): $(DUMB_INIT_BIN)
	cp $(DUMB_INIT_BIN) $(DUMB_INIT_CP)
	file $(DUMB_INIT_CP)



check distcheck build: $(CARL_EXIT_CP) $(DUMB_INIT_CP)


clean:
	set -xe; $(MAKE) -C ../carl-exit clean
	set -xe; rm -f $(CARL_EXIT_CP) $(DUMB_INIT_CP)
