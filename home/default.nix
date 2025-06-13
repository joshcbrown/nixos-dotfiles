{
  imports =
    [ ./term ./packages.nix ./files.nix ./hyprland ./anyrun ./firefox.nix ];
  home.username = "josh";
  home.homeDirectory = "/home/josh";
  home.stateVersion = "25.11";
}
