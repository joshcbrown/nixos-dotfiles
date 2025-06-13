{
  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  home.file.".config/nvim" = {
    source = ../config/nvim;
    recursive = true;
  };
  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';
}
