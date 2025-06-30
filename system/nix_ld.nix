{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
      glib
      nss
      nspr
      atk
      cups
      dbus
      libdrm
      gtk3
      pango
      cairo
      xorg.libX11
      xorg.libxcb
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXrandr
      libgbm
      expat
      libxkbcommon
      alsa-lib
    ];
  };
}
