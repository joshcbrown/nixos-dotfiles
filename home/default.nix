{
  imports = [
    ./term
    ./packages.nix
    ./waybar.nix
    ./files.nix
    ./hyprland
    ./anyrun
    ./cursor.nix
    ./services
  ];
  home.username = "josh";
  home.homeDirectory = "/home/josh";
  home.stateVersion = "25.11";
}
