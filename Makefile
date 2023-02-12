# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlegrand <tlegrand@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/03 11:42:37 by tlegrand          #+#    #+#              #
#    Updated: 2023/02/12 21:08:59 by tlegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	PROJECT VARIABLES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#

#	==============================	NAMES	==============================	#
NAME		=	pipex
NAME_B		=	pipex_bonus


#	==============================	SOURCES	==============================	#
DIR_SRCS		=	srcs/

LST_SRCS		= 	pipex.c ft_parsing.c ft_cmd_exe.c ft_get_argv.c ft_get_io.c ft_get_path.c \
					ft_utils.c  ft_clean.c
SRCS			=	${addprefix ${DIR_SRCS}, ${LST_SRCS}}

LST_SRCS_B		=	pipex_bonus.c ft_parsing.c ft_cmd_exe.c ft_get_argv.c ft_get_io.c ft_get_path.c \
					ft_utils.c  ft_clean.c \
					ft_here_doc.c
SRCS_B			=	${addprefix ${DIR_SRCS}, ${LST_SRCS_B}}

#	==============================	OBJECTS	==============================	#
DIR_OBJS	=	.objs/
OBJS		=	${patsubst ${DIR_SRCS}%.c, ${DIR_OBJS}%.o, ${SRCS}}
OBJS_B		=	${patsubst ${DIR_SRCS}%.c, ${DIR_OBJS}%.o, ${SRCS_B}}


#	==============================	HEADERS	==============================	#
DIR_HEADER	=	include/
HEADER		=	${addprefix ${DIR_HEADER}, pipex.h}
HEADER_B	=	${addprefix ${DIR_HEADER}, pipex_bonus.h}


#	==============================	LIBRARY	==============================	#
DIR_LIBFT	=	libft/
LIBFT		=	$(addprefix $(DIR_LIBFT), libft.a)


#	==============================	COMMANDS	==============================	#
CC 			=	cc
MKDIR 		=	mkdir -p
RM			=	rm -rf
MAKE		=	make -s


#	==============================	FLAGS	==============================	#
CFLAGS		=	-Wall -Wextra -Werror -I${DIR_HEADER}



#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	RULES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#
.PHONY : all clean fclean re bonus FORCE nn

#	==============================	BASIC	==============================	#
all		:	${NAME}

clean	:
		@${RM} ${DIR_OBJS}
		@$(MAKE) -C $(DIR_LIBFT) clean

fclean	:	clean
		@${RM} ${NAME} ${NAME_B}
		@$(MAKE) -C $(DIR_LIBFT) fclean
		@printf "$(GREEN)All clean !\n$(END)"

re		:	fclean
		@${MAKE} all


#	==============================	COMPILATION	==============================	#
${NAME}			:	${LIBFT} ${DIR_OBJS} ${OBJS}
				@${CC} ${CFLAGS} ${OBJS} ${LIBFT} -o ${NAME}
				@printf "$(GREEN_LIGHT)${NAME} created !\n$(END)"

bonus			:	{LIBFT} ${DIR_OBJS} ${OBJS_B}
				@${CC} ${CFLAGS} ${OBJS_B} ${LIBFT} -o ${NAME_B}
				@printf "$(GREEN_LIGHT)${NAME_B} created !\n$(END)"

${DIR_OBJS}%.o	:	${DIR_SRCS}%.c ${HEADER} ${HEADER_B} 
				@printf "$(ORANGE)Making $@...\n$(END)"
				@${CC} ${CFLAGS} -c $< -o $@


#	==============================	UTILS/LIB	==============================	#
${DIR_OBJS}	:
			@${MKDIR} ${DIR_OBJS}
			
nn			:
			@norminette ${SRCS} {SRCS_B} ${HEADER} ${HEADER_B}

$(LIBFT)	:	FORCE
			@$(MAKE) -C $(DIR_LIBFT)

FORCE		:



#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	OPERATING VARIABLES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#

#	==============================	COLORS	==============================	#
BLACK		=	\033[0;30m
RED			=	\033[0;31m
GREEN		=	\033[0;32m
ORANGE		=	\033[0;33m
BLUE		=	\033[0;34m
PURPLE		=	\033[0;35m
CYAN		=	\033[0;36m
GRAY_LIGHT	=	\033[0;37m
GRAY_DARK	=	\033[1;30m
RED_LIGHT	=	\033[1;31m
GREEN_LIGHT	=	\033[1;32m
YELLOW 		=	\033[1;33m
BLUE_LIGHT	=	\033[1;34m
VIOLET		=	\033[1;35m
CYAN		=	\033[1;36m
WHITE		=	\033[1;37m
