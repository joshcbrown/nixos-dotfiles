{ pkgs, inputs, ... }: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages =
    [ inputs.hyprland-contrib.packages.${pkgs.system}.grimblast ];
  environment.variables.NIXOS_OZONE_WL = "1";
}

