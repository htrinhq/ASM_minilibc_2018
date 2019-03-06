##
## EPITECH PROJECT, 2019
## ASM_minilibc_2018
## File description:
## Makefile
##

INC	=	inc/

DIR	=	src/

SRC	=	strlen.asm\
		memset.asm\
		strchr.asm\
		memcpy.asm\
		strcmp.asm

SRCS	=	$(addprefix $(DIR), $(SRC))

CC	=	nasm

LINK	=	ld

NAME	=	libasm.so

CFLAGS	=	-shared -fPIC

ASMFLAGS	=	-f elf64

TESTOBJ	=	$(TESTSRC:.c=.o)

OBJ	=	$(SRCS:.asm=.o)

all:	$(NAME)

$(NAME):	$(OBJ)
	$(LINK) $(CFLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	$(CC) $(ASMFLAGS) $< -o $@

clean:
		rm -rf $(OBJ)

fclean:	clean
		rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re