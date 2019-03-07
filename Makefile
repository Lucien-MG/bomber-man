# Makefile

CC = gcc
CPPFLAGS =
CFLAGS = -Wall -Wextra 
LDFLAGS = 
LDLIBS = -lSDL2 `sdl2-config --cflags --libs`

EXE = bomber-man.exe

all: ${EXE}

${EXE}: src/main.c src/window.c
	${CC} src/main.c src/window.c -o bomber-man ${CFLAGS} ${LDLIBS}

.PHONY: clean

clean:
	${RM} ${EXE}

# END