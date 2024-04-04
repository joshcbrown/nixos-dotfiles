{
  pkgs,
  config,
  ...
}: {
  # Place Files Inside Home Directory
  home.file.".emoji".source = ./files/emoji;
  home.file.".base16-themes".source = ./files/base16-themes;
  home.file.".config/rofi/rofi.jpg".source = ../../wallpapers/evening-sky.png;
  home.file.".config/swaylock-bg.jpg".source = ../../wallpapers/other-street.png;
  home.file.".local/share/fonts" = {
    source = ./files/fonts;
    recursive = true;
  };
  home.file.".config/wlogout/icons" = {
    source = ./files/wlogout;
    recursive = true;
  };
  home.file.".config/doom" = {
    source = ./files/doom;
    recursive = true;
  };
}
