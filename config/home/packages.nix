{
  pkgs,
  config,
  inputs,
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
    anki
    signal-desktop
    inputs.caydence.packages."${pkgs.system}".default
    (nerdfonts.override {fonts = ["JetBrainsMono" "FiraCode" "NerdFontsSymbolsOnly"];})
    (import ./../scripts/rofi-launcher.nix {inherit pkgs;})
    (import ./../scripts/screenshootin.nix {inherit pkgs;})
    (pkgs.callPackage ../pkgs/cargo-wizard.nix {})
  ];

  programs.gh.enable = true;
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
