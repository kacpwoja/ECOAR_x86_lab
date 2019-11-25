# Program name
NAME		= kwojakow

# Compiler
CC		= cc
ASMBIN		= nasm

# Directories
SRCDIR		= source
INCDIR		= headers
BUILDDIR	= build

# Flags etc.
M32FLAG		= -m32
CFLAGS		= -g -O0
LIBS		=
INC		= -I$(INCDIR)
AFLAGS		= -f elf

# ------------------
# Functionality
# ------------------
CSRC		= $(shell find $(SRCDIR) -name '*.c')
ASRC		= $(shell find $(SRCDIR) -name '*.asm')
SRC		= $(CSRC)$(ASRC)
OBJ		= $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(CSRC)) $(patsubst $(SRCDIR)/%.asm,$(BUILDDIR)/%.o,$(ASRC))

# Default
compile: makedir $(NAME)

# Link
$(NAME): $(OBJ)
	$(CC) $(M32FLAG) -o $(NAME) $^ $(LIBS)

# Clean objects
clean:
	@rm -f $(BUILDDIR)/*

# Clean the binary too
fullclean: clean
	@rm -f $(NAME)

# Full clean and make again
remake: fullclean compile

# Create Build directory
makedir:
	@mkdir -p $(BUILDDIR)

# Compile
$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(M32FLAG) $(CFLAGS) -o $@ -c $< $(INC)

$(BUILDDIR)/%.o: $(SRCDIR)/%.asm
	$(ASMBIN) $(AFLAGS) -o $@ $<

# PHONY
.PHONY: compile clean fullclean remake 
