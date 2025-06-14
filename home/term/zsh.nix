{
  programs.zsh = {
    enable = true;
    shellAliases = {
      lg = "lazygit";
      ls =
        "eza --hyperlink --sort=time --time=modified --time-style=relative --all --git --color=auto --icons=auto --group-directories-first --dereference";
      rb = "sudo nixos-rebuild switch --flake ~/.config/nixos";
      # HACK: should really get rid of this asap
      haskell-language-server = "haskell-language-server-9.10.1";
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
