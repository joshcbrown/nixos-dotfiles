{
  pkgs,
  config,
  lib,
  ...
}: let
  palette = config.colorScheme.palette;
  inherit (import ../../options.nix) alacritty wezterm kitty;
in
  lib.mkIf (wezterm
    == false
    && alacritty == false
    || kitty == true) {
    # Configure Kitty
    programs.kitty = {
      enable = true;
      package = pkgs.kitty;
      font.name = "JetBrainsMono";
      font.size = 12;
      settings = {
        scrollback_lines = 2000;
        wheel_scroll_min_lines = 1;
        window_padding_width = 4;
        confirm_os_window_close = 0;
        background_opacity = "0.85";
      };
      theme = "Tokyo Night Storm";
    };
  }
