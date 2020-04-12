#include "uchat.h"

int mx_run_function_type(t_server_info *info, t_package *package) {
    int return_value = -1;
    int type = package->type;

    if (type == MX_MSG_TYPE)
        return_value = mx_process_message_in_server(info, package);
    else if (type == MX_FILE_TYPE)
        return_value = mx_process_file_in_server(info, package);
    return return_value;
}