#include "uchat.h"

int mx_worker(int client_sock) {
    ssize_t size = 0;
    char client_input[MAX_CLIENT_INPUT];
    time_t now;
    int autorized = 0;

    now = time(0);
    char * time_str = ctime(&now);
    time_str[strlen(time_str) - 1] = '\0';

    //if check_user in db  == -1 -

//    if ((autorized = mx_check_client(client_sock)) == -1)
//        return 0;
    autorized = 1;
    if(autorized) {
        size = read(client_sock, &client_input, MAX_CLIENT_INPUT);
        if (size == -1)
            return -1;
        printf("%s\tReceived %s\n", time_str, client_input);

        size = write(client_sock, client_input, sizeof(client_input));
        return (int) size;
    }
    else
        return 0;
}
/*
void mx_login(t_info *info, t_clients *client_info) {
    char *input = NULL;

    while(1) {
        write(client_info->fd, "1 - sign_in\t2 - sign_up\t3 - exit\n", 33);
input = mx_read_client_input(client_info->fd);
        if (input == NULL || strcmp(input, "") == 0
            || strcmp(input, "exit") == 0 || input[0] == 51)
            write(client_info->fd, "exit\n", 5);
        else if (strcmp(input, "sign_in") == 0 || input[0] == 49)
            mx_sign_in(info, client_info);
        else if (strcmp(input, "sign_up") == 0 || input[0] == 50)
            mx_sign_up(info, client_info);
        mx_strdel(&input);
    }
    mx_strdel(&input);
}

 */
