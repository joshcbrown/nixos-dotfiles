{ pkgs, ... }: {
  home.packages = with pkgs; [
    zip
    xz
    unzip
    ripgrep
    lazygit
    jq
    fzf
    fd
    which
    nix-output-monitor
    btop
    strace
    ltrace
    lsof
    sysstat
    gcc
    luarocks
    lua
    python3
    cargo
    nixfmt-classic
  ];
}
