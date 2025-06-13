{
  programs.zsh = {
    enable = true;
    shellAliases = {
      lg = "lazygit";
      ls =
        "eza --hyperlink --sort=time --time=modified --time-style=relative --all --git --color=auto --icons=auto --group-directories-first --dereference";
      rb = "sudo nixos-rebuild switch --flake ~/.config/nixos";
    };
    antidote.enable = true;
    antidote.plugins = [
      "jeffreytse/zsh-vi-mode"
      "zsh-users/zsh-autosuggestions"
      "zdharma-continuum/fast-syntax-highlighting kind:defer"
    ];
    enableCompletion = true;
  };
}
