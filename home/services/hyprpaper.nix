{ pkgs, inputs, ... }: {
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.default;

    settings = {
      preload = [ "~/.config/nixos/evening-sky.png" ];
      wallpaper = [ ", ~/.config/nixos/evening-sky.png" ];
    };
  };
}
