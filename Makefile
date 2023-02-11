# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlegrand <tlegrand@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/03 11:42:37 by tlegrand          #+#    #+#              #
#    Updated: 2023/02/11 22:25:57 by tlegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	pipex
NAME_B		=	pipex_bonus

DIR_OBJS	=	.objs/

SRCS		= 	pipex.c ft_parsing.c ft_cmd_exe.c ft_get_argv.c ft_get_io.c ft_get_path.c \
				ft_utils.c  ft_clean.c
LIST_OBJS	=	${SRCS:.c=.o}
OBJS		=	${addprefix ${DIR_OBJS}, ${LIST_OBJS}}

SRCS_B		=	pipex_bonus.c ft_parsing.c ft_cmd_exe.c ft_get_argv.c ft_get_io.c ft_get_path.c \
				ft_utils.c  ft_clean.c \
				ft_here_doc.c
LIST_OBJS_B	=	${SRCS_B:.c=.o}
OBJS_B		=	${addprefix ${DIR_OBJS}, ${LIST_OBJS_B}}

HEADER		=	pipex.h

HEADER_B		=	pipex_bonus.h

LIB			=	libft/libft.a

FLAGS		=	-Wall -Wextra -Werror -I .

RM			=	rm -rf


all		:	lib ${NAME}

${NAME}	:	${OBJS}
		${CC} ${FLAGS} -o ${NAME} ${OBJS} ${LIB}

bonus	:	${OBJS_B}
		${CC} ${FLAGS} -o ${NAME_B} ${OBJS_B} ${LIB}

nn	:
	norminette ${SRCS} {SRCS_B} ${HEADER} ${HEADER_B}

lib	:
	${MAKE} -C libft

${DIR_OBJS}%.o	:	%.c ${HEADER} ${HEADER_B} 
				@mkdir -p ${DIR_OBJS}
				${CC} ${FLAGS} -c $< -o $@

clean	:
		${RM} ${DIR_OBJS}
		make -C libft clean

fclean	:	clean
		${RM} ${NAME} ${NAME_B}
		make -C libft fclean

re	:	fclean
	${MAKE} all

.PHONY : all clean fclean re bonus lib nn