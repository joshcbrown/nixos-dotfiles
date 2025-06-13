{ config, pkgs, ... }:

{
  imports = [ ./home ];
  home.username = "josh";
  home.homeDirectory = "/home/josh";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    zip
    xz
    unzip
    ripgrep
    lazygit
    jq
    fzf
    fd
    which
    nix-output-monitor
    btop 
    strace
    ltrace
    lsof
    sysstat
  ];

  programs.git = {
    enable = true;
    userName = "joshcbrown";
    userEmail = "joshcarlbrown@gmail.com";
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      lg = "lazygit";
      ls = "eza --hyperlink --sort=time --time=modified --time-style=relative --all --git --color=auto --icons=auto --group-directories-first --dereference";
    };
    antidote.enable = true;
    antidote.plugins = [
      "jeffreytse/zsh-vi-mode"
      "zsh-users/zsh-autosuggestions"
      "zdharma-continuum/fast-syntax-highlighting kind:defer"
    ];
    enableCompletion = true;
  };

  home.stateVersion = "25.11";
}
