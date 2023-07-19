all:
NAME = main

BUILD_DIR ?= ./build
OBJ_DIR ?= $(BUILD_DIR)
BINARY ?= $(BUILD_DIR)/$(NAME)
INC_DIR = ./inc
SRC_DIR = ./src

SRCS = $(shell find $(SRC_DIR) -name "*.c")
OBJS = $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
INCLUDES = $(addprefix -I, $(INC_DIR))
LD_LIBS = 

# External definitions
COMPILE_TIME = $(shell date +"%Y-%M-%d %H:%M:%S")
GIT_HEAD = $(shell git show -s --pretty=format:%h)
DEFS += -D COMPILE_TIME="\"$(COMPILE_TIME)\""
DEFS += -D GIT_HEAD="\"$(GIT_HEAD)\""
DEFS += -D EXTDEFS_ENABLE

# Compile commands
CC = gcc
LD = gcc

CFLAGS += -Wall -Werror -O2 -MMD $(INCLUDES) $(DEFS)

# Depencies
-include $(OBJS:.o=.d)

# Rules
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo +CC $<
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c -o $@ $<

$(BINARY): $(OBJS)
	@echo +LD $@
	@$(LD) -O2 -rdynamic -o $@ $^ $(LD_LIBS)

run: $(BINARY)
	@echo [run] $^
	@$(BINARY)

all: $(BINARY)
	@echo [build] ok

clean:
	@echo [CLEAN]
	-rm -rf $(BUILD_DIR)

.PHONY = all run clean
