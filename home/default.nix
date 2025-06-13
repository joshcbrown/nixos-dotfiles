{ config, pkgs, ... }:

{
  imports = [ ./term ./packages.nix ./files.nix ];
  home.username = "josh";
  home.homeDirectory = "/home/josh";

  programs.git = {
    enable = true;
    userName = "joshcbrown";
    userEmail = "joshcarlbrown@gmail.com";
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = { enable = true; };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.stateVersion = "25.11";
}
