NAME = main

BUILD_DIR ?= ./build
OBJ_DIR ?= $(BUILD_DIR)/obj
BINARY ?= $(BUILD_DIR)/$(NAME)
INC_DIR += ./inc

INCLUDES = $(addprefix -I, $(INC_DIR))
SRCS = $(shell find src/ -name "*.c")
OBJS = $(SRCS:src/%.c=$(OBJ_DIR)/%.o)
LD_LIBS = 

CC = gcc
LD = gcc

CFLAGS += -Wall -Werror -O2 -MMD $(INCLUDES)

# Depencies
-include $(OBJS:.o=.d)

$(OBJ_DIR)/%.o: src/%.c
	@echo +CC $<
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c -o $@ $<

$(BINARY): $(OBJS)
	@echo +LD $@
	@$(LD) -O2 -rdynamic -o $@ $^ $(LD_LIBS)

run: $(BINARY)
	@echo [RUN] $^
	$(BINARY)

clean:
	@echo [CLEAN]
	-rm -rf $(BUILD_DIR)
