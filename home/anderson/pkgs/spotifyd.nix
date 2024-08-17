{
    services.spotifyd = {
        enable = true;
        settings = {
            global = {
                username_cmd = "pass show Spotify | head -2 | tail -1 | awk '{print $2}'";
                password_cmd = "pass show Spotify | head -1";
                backend = "pulseaudio";
            };
        };
    };
}
