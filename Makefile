# Makefile

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
DEBUG_FLAGS = 
RELEASE_FLAGS = 

# Flags:
CC = gcc
CFLAGS = -Wall -Wextra -fsanitize=address -I ${INCLUDE_FOLDER}
LDFLAGS = 
LDLIBS = -lSDL2 `sdl2-config --cflags --libs`

EXE = bomber-man

all: ${BUILD_FOLDER} ${OBJECT_FOLDER} ${BUILD_FOLDER}${EXE}

${BUILD_FOLDER}${EXE}: ${OBJS} 
	${CC} ${OBJS} -o ${BUILD_FOLDER}${EXE} ${CFLAGS} ${LDLIBS}

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