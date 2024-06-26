{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (import ../../options.nix) flakeDir theShell hostname;
in
  lib.mkIf (theShell == "zsh") {
    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableAutosuggestions = true;
      historySubstringSearch.enable = true;
      plugins = [
        {
          name = "vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }
      ];

      profileExtra = ''
        #if [ -z "$DISPLAY" ] && [ "$XDG_VNTR" = 1 ]; then
        #  exec Hyprland
        #fi
      '';
      initExtra = ''
        zstyle ":completion:*" menu select
        zstyle ":completion:*" matcher-list "" "m:{a-z0A-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
        if type nproc &>/dev/null; then
          export MAKEFLAGS="$MAKEFLAGS -j$(($(nproc)-1))"
        fi
        bindkey '^[[3~' delete-char                     # Key Del
        bindkey '^[[5~' beginning-of-buffer-or-history  # Key Page Up
        bindkey '^[[6~' end-of-buffer-or-history        # Key Page Down
        bindkey '^[[1;3D' backward-word                 # Key Alt + Left
        bindkey '^[[1;3C' forward-word                  # Key Alt + Right
        bindkey '^[[H' beginning-of-line                # Key Home
        bindkey '^[[F' end-of-line                      # Key End
        if [ -f $HOME/.zshrc-personal ]; then
          source $HOME/.zshrc-personal
        fi
        eval "$(starship init zsh)"
        eval "$(zoxide init zsh)"
        eval "$(direnv hook zsh)"
      '';
      initExtraFirst = ''
        HISTFILE=~/.histfile
        HISTSIZE=1000
        SAVEHIST=1000
        setopt autocd nomatch
        unsetopt beep extendedglob notify
        autoload -Uz compinit
        compinit
      '';
      sessionVariables = {
      };
      shellAliases = {
        sv = "sudo nvim";
        rebuild = "nh os switch --nom --hostname ${hostname}";
        update = "nh os switch --nom --hostname ${hostname} --update";
        gcCleanup = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
        v = "nvim";
        ls = "eza";
        ll = "eza -l";
        la = "eza -a";
        lt = "eza --tree -d 3";
        lg = "lazygit";
        ".." = "cd ..";
        neofetch = "neofetch --ascii ~/.config/ascii-neofetch";
      };
    };
    home.packages = with pkgs; [
      bat
      fd
      du-dust
      lazygit
      eza
    ];
  }
