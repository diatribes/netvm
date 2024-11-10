.SILENT:

all: clean build

BIN := dumb-init
SRC := dumb-init.c

check distcheck build: $(BIN)
	set -xe; file $(BIN)

$(BIN): $(SRC)
	set -xe; musl-gcc --static -o $(BIN) -O2 $(SRC)
	set -xe; strip $(BIN)

clean:
	set -xe; rm -f $(BIN)
