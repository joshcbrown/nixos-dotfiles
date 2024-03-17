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
  fonts.fontconfig.enable = true;
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
    filelight
    jetbrains-mono
    (nerdfonts.override {fonts = ["JetBrainsMono" "FiraCode" "NerdFontsSymbolsOnly"];})
    (import ./../scripts/rofi-launcher.nix {inherit pkgs;})
    (import ./../scripts/screenshootin.nix {inherit pkgs;})
    (pkgs.callPackage ../pkgs/caydence.nix {})
    (pkgs.callPackage ../pkgs/cargo-wizard.nix {})
  ];

  programs.gh.enable = true;
}
