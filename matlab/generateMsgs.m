function generateMsgs()

    msg_path = fullfile(pwd, "custom/starq_interfaces/msg/");
    srv_path = fullfile(pwd, "custom/starq_interfaces/srv/");
    action_path = fullfile(pwd, "custom/starq_interfaces/action/");
    copyfile("../starq_interfaces/msg/", msg_path, 'f');
    copyfile("../starq_interfaces/srv/", srv_path, 'f');
    copyfile("../starq_interfaces/action", action_path, 'f');
    
    folder_path = fullfile(pwd, "custom");
    ros2genmsg(folder_path)

end