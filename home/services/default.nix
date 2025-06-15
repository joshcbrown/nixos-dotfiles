{
  imports = [ ./hyprpaper.nix ];
  services = {
    swayosd.enable = true;
    dropbox = {
      enable = true;
      path = /home/josh/Dropbox;
    };
  };
}
