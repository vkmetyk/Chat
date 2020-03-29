NAME_S = uchat_server
NAME_C = uchat

INC = uchat.h

SRC_SERVER = main_server.c \
	init_info_server.c \
	daemonize.c \
	start_server.c \
	start_client_server.c \
	work_with_clients_list.c \
	read_client_input.c \
	check_client_requests.c \
	chat_connect.c \
	sign_in.c \
	sign_up.c \
	chat_menu.c \
	message_received.c

SRC_CLIENT = main_client.c \
    init_info.c \
	start_client.c \
	input_from_client.c \
	input_from_server.c

SRC_HELP = err_exit.c

OBJ_SERVER = main_server.o \
	init_info_server.o \
	daemonize.o \
	start_server.o \
	start_client_server.o \
	work_with_clients_list.o \
	read_client_input.o \
	check_client_requests.o \
	chat_connect.o \
	sign_in.o \
	sign_up.o \
	chat_menu.o \
	message_received.o

OBJ_CLIENT = main_client.o \
    init_info.o \
	start_client.o \
	input_from_client.o \
	input_from_server.o

OBJ_HELP = err_exit.o

CFLAGS = -std=c11 -Wall -Wextra -Werror -Wpedantic

all: install clean

install:
	#@make install -C libmx
	@cp $(addprefix inc/, $(INC)) .
	@cp $(addprefix src/server/, $(SRC_SERVER)) .
	@cp $(addprefix src/client/, $(SRC_CLIENT)) .
	@cp $(addprefix src/help_funcs/, $(SRC_HELP)) .
	@clang $(CFLAGS) -c $(SRC_SERVER) $(SRC_HELP) -I $(INC)
	@clang $(CFLAGS) -c $(SRC_CLIENT) $(SRC_HELP) -I $(INC)
	@clang $(CFLAGS) libmx/libmx.a $(OBJ_SERVER) $(OBJ_HELP) -o $(NAME_S) -lsqlite3
	@clang $(CFLAGS) libmx/libmx.a $(OBJ_CLIENT) $(OBJ_HELP) -o $(NAME_C) -lsqlite3
	@mkdir -p obj
	@mv $(OBJ_SERVER) $(OBJ_CLIENT) ./obj

uninstall: clean
	#@make uninstall -C libmx
	@rm -rf $(NAME_S) $(NAME_C)

clean:
	#@make clean -C libmx
	@rm -rf $(INC)
	@rm -rf $(SRC) $(SRC_SERVER) $(SRC_CLIENT) $(SRC_HELP)
	@rm -rf $(OBJ) $(OBJ_SERVER) $(OBJ_CLIENT) $(OBJ_HELP)
	@rm -rf ./obj

reinstall: uninstall install
