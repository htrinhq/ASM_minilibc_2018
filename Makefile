##
## EPITECH PROJECT, 2019
## ASM_minilibc_2018
## File description:
## Makefile
##

INC	=	inc/

DIR	=	src/

SRC	=	strlen.asm

SRCS	=	$(addprefix $(DIR), $(SRC))

CC	=	nasm

LINK	=	ld

CFLAGS	=	-shared -fPIC

ASMFLAGS	=	-f elf64

TEST	=	test

NAME	=	libasm.so

TESTSRC	=	tester.c

TESTOBJ	=	$(TESTSRC:.c=.o)

OBJ	=	$(SRCS:.asm=.o)

all:	$(NAME)

$(NAME):	$(OBJ)
	$(LINK) $(CFLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	$(CC) $(ASMFLAGS) $< -o $@

test:	$(TEST)

$(TEST):	$(TESTOBJ)
		gcc -o $(TEST) $(TESTOBJ)

clean:
		rm -rf $(OBJ) $(TESTOBJ)

fclean:	clean
		rm -rf $(NAME)
		rm -rf $(TEST)

re: fclean all

.PHONY: all clean fclean re