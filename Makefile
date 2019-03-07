# Makefile

CC = gcc
CPPFLAGS =
CFLAGS = -Wall -Wextra -lSDL2 `sdl2-config --cflags --libs`
LDFLAGS = 
LDLIBS =

EXE = bomber-man

all: ${EXE}

${EXE}: src/main.c
	${CC} src/main.c ${CFLAGS}

.PHONY: clean

clean:
	${RM} ${EXE}

# END