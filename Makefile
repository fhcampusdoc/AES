IDIR=include
CC=gcc
CFLAGS=-I$(IDIR)

ODIR=obj
SDIR=src
LDIR=

LIBS=

_DEPS = stdafx.h targetver.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

OBJ = main.o stdafx.o
#OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

aes: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)
	
.PHONY: clean

clean:
	rm -vf *.o aes
