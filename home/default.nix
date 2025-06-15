{
  imports = [
    ./term
    ./packages.nix
    ./waybar.nix
    ./files.nix
    ./hyprland
    ./anyrun
    ./cursor.nix
    ./wlogout.nix
    ./services
    ./sioyek.nix
    ./mako.nix
  ];
  home.username = "josh";
  home.homeDirectory = "/home/josh";
  home.stateVersion = "25.11";
}
