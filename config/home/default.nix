{
  pkgs,
  config,
  ...
}: {
  imports = [
    # Enable &/ Configure Programs
    ./alacritty.nix
    ./bash.nix
    ./gtk-qt.nix
    ./hyprland.nix
    ./kitty.nix
    ./neovim.nix
    ./packages.nix
    ./rofi.nix
    ./starship.nix
    ./waybar.nix
    ./wlogout.nix
    ./swappy.nix
    ./swaylock.nix
    ./swaync.nix
    ./wezterm.nix
    ./zsh.nix

    # Place Home Files Like Pictures
    ./files.nix
  ];
}
