# Makefile

# Compiling options:
release = 1 

# Command:
MKDIR_P = mkdir -p
RM_R = rm -r 
RMDIR = rmdir

# Folder:
INCLUDE_FOLDER = inc/
SOURCE_FOLDER = src/
RESSOURCE_FOLDER = res/
OBJECT_FOLDER = obj/
BUILD_FOLDER = build/

# Files:
SRCS = $(shell find $(SOURCE_FOLDER) -name '*.c')
OBJS = $(patsubst ${SOURCE_FOLDER}%.c,${OBJECT_FOLDER}%.o,${SRCS})

# Optional Flags:
DEBUG_FLAGS = -fsanitize=address -g -Og
RELEASE_FLAGS = -O3

# Library:
SDL2 = /usr/lib/x86_64-linux-gnu/libSDL2.a
SDL2_image = /usr/lib/x86_64-linux-gnu/libSDL2_image.a

# Flags:
CC = gcc
CFLAGS = -Wall -Wextra -I ${INCLUDE_FOLDER}
LDFLAGS = -lSDL2 -lSDL2_image `sdl2-config --cflags --libs`
LDLIBS = -L /usr/lib/

# Compiling options code:
ifdef release
	CFLAGS := ${RELEASE_FLAGS} ${CFLAGS}
else
	CFLAGS := ${DEBUG_FLAGS} ${CFLAGS}
endif

# Executable build:
EXE = bomber-man

all: ${BUILD_FOLDER} ${OBJECT_FOLDER} ${BUILD_FOLDER}${EXE}

${BUILD_FOLDER}${EXE}: ${OBJS} 
	${CC} ${OBJS} -o ${BUILD_FOLDER}${EXE} ${CFLAGS} ${LDLIBS} ${LDFLAGS}

${OBJECT_FOLDER}%.o: ${SOURCE_FOLDER}%.c
	${CC} -o $@ -c $< ${CFLAGS}

# Creation of build folder:
${BUILD_FOLDER}:
	${MKDIR_P} ${BUILD_FOLDER}

${OBJECT_FOLDER}:
	${MKDIR_P} ${OBJECT_FOLDER}

.PHONY: clean

clean:
	${RM} ${BUILD_FOLDER}${EXE}
	${RMDIR} ${BUILD_FOLDER}

	${RM_R} ${OBJECT_FOLDER}

# END