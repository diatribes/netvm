.SILENT:

all: build

BIN := carl-exit
OBJ := carl-exit.o
SRC := carl-exit.asm

check distcheck build: $(BIN)
	set -xe; file $(BIN)

$(OBJ): $(SRC)
	set -xe; nasm -felf64 $(SRC) -o $@

$(BIN): $(OBJ)
	set -xe; ld -z noseparate-code -s -static -nostdlib -o $(BIN) $(OBJ)
	set -xe; strip $(BIN)

clean:
	set -xe; rm -f $(OBJ) $(BIN)
