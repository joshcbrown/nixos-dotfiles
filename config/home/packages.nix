{
  pkgs,
  config,
  username,
  ...
}: let
  inherit
    (import ../../options.nix)
    browser
    wallpaperDir
    wallpaperGit
    flakeDir
    ;
in {
  # Install Packages For The User
  home.packages = with pkgs; [
    pkgs."${browser}"
    discord
    libnotify
    libvirt
    swww
    grim
    slurp
    gnome.file-roller
    swaynotificationcenter
    rofi-wayland
    imv
    transmission-gtk
    mpv
    gimp
    obs-studio
    rustup
    audacity
    pavucontrol
    tree
    protonup-qt
    font-awesome
    spotify
    swayidle
    neovide
    swaylock
    alejandra
    zoxide
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    (import ./../scripts/rofi-launcher.nix {inherit pkgs;})
    (import ./../scripts/screenshootin.nix {inherit pkgs;})
    (pkgs.callPackage ../pkgs/caydence.nix {})
  ];

  programs.gh.enable = true;
}
