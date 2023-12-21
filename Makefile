# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: auguste <auguste@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/20 19:32:45 by aderouba          #+#    #+#              #
#    Updated: 2023/12/21 01:21:12 by auguste          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAKEFLAGS		:=	--no-print-directory
.DEFAULT_GOAL	:=	all
.DELETE_ON_ERROR:
.SECONDEXPANSION:

#=================================COMPILATION==================================#
CC			:=	gcc
CFLAGS		:=	-MP -MMD -I .
SDL_FLAGS	:=	`sdl2-config --cflags --libs`

#==================================EXECUTABLE==================================#
NAME		:=	SDL2_base
BUILD_DIR	:=	.build
BIN_DIR		:=	bin

#=================================SOURCE FILES=================================#
SRCS	:=	srcs/main.c

#====================================OBJECTS===================================#
OBJS	:=	${SRCS:%.c=$(BUILD_DIR)/%.o}
DEPS	:=	$(SRCS:%.c=$(BUILD_DIR)/%.d)
DIRS	:=	$(sort $(shell dirname $(BUILD) $(OBJS)))

#====================================COLORS====================================#
NOC			:=	\033[0m
RED			:=	\e[1m\e[38;5;196m
GREEN		:=	\e[1m\e[38;5;76m
BLUE		:=	\e[1m\e[38;5;33m
PURPLE		:=	\033[1;35m

#==============================PROGRESS BAR UTILS==============================#
PERCENT				:=	0
NB_COMPIL			:=	0
TOTAL_COMPIL		:=	$(words $(OBJS))

#=====================================RULES====================================#
all : $(BIN_DIR)/$(NAME)

$(DIRS):
	@mkdir -p $@

$(BUILD_DIR)/%.o : %.c | $$(@D)
	$(if $(filter $(NB_COMPIL),0), @echo "$(BLUE)Compiling$(NOC)")
	$(eval NB_COMPIL=$(shell echo $$(($(NB_COMPIL)+1))))
	$(eval PERCENT=$(shell echo $$(($(NB_COMPIL) * 100 / $(TOTAL_COMPIL)))))
	@if [ $(PERCENT) -lt 10 ]; then echo -n "[  $(PERCENT)%]"; elif [ $(PERCENT) -lt 100 ]; then echo -n "[ $(PERCENT)%]"; else echo -n "[$(PERCENT)%]"; fi
	@echo " $(PURPLE)Building $<$(NOC)"
	@$(CC) $(CFLAGS) -o $@ -c $< $(SDL_FLAGS)

$(BIN_DIR)/$(NAME) : $(OBJS)
	@echo "$(BLUE)Creation of binary$(NOC)"
	@$(CC) -o $(BIN_DIR)/$(NAME) $(OBJS) $(SDL_FLAGS)
	@echo "$(GREEN)Done$(NOC)"


clean :
	@echo "$(RED)Deleting objects$(NOC)"
	@rm -rf $(DIRS)

fclean : clean
	@echo "$(RED)Deleting binary$(NOC)"
	@rm -f $(NAME)

re :
	@clear
	@make fclean
	@make all

run : $(BIN_DIR)/$(NAME)
	@./$<

.PHONY: all clean fclean re run

-include $(DEPS)
