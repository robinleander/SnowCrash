CC=gcc
CFLAGS=-c -Wall -O0 -g -std=gnu11 -Wpedantic -Wextra
LDFLAGS=-lm
SRCDIR=.
SOURCES=$(wildcard $(SRCDIR)/*.c) 
HEADERS=$(wildcard $(SRCDIR)/*.h)
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=snowcrash
PREFIX=/usr/bin

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
		$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

.c.o:
		$(CC) $(CFLAGS) $< -o $@

$(OBJECTS): $(HEADERS)

clean:
		rm -f $(SRCDIR)/*.o

install:
		cp $(EXECUTABLE) $(PREFIX)

remove:
		rm -vi $(PREFIX)/$(EXECUTABLE)