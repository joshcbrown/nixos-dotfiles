{ pkgs, ... }: {

  fonts = {
    packages = with pkgs; [
      roboto
      work-sans
      comic-neue
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts.fira-code
      nerd-fonts.meslo-lg
      nerd-fonts.jetbrains-mono
      openmoji-color
      twemoji-color-font
    ];
  };
}
