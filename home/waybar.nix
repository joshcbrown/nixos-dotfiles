# In your home-manager configuration (home.nix or similar)
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "disk" "cpu" "memory" "tray" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
        };

        cpu = {
          format = " {usage}% cpu";
          tooltip = false;
          interval = 1;
        };

        memory = {
          format = " {percentage}% ram";
          tooltip = false;
          interval = 1;
        };

        disk = {
          format = " {percentage_used}% disk";
          path = "/";
          tooltip-format = "Used: {used} / Total: {total}";
          interval = 30;
        };

        clock = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = "{:%Y-%m-%d}";
        };

        tray = {
          icon-size = 18;
          spacing = 6;
          show-passive-items = false;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: Inter, Roboto, Helvetica, Arial, sans-serif;
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background-color: rgba(43, 48, 59, 0.8);
        border-bottom: 3px solid rgba(100, 114, 125, 0.5);
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
      }

      #workspaces {
        margin: 0 4px;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #ffffff;
        border-bottom: 3px solid transparent;
      }

      #workspaces button:hover {
        background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.active {
        border-bottom: 3px solid #8fbcbb;
        color: #8fbcbb;
      }

      #workspaces button.urgent {
        background-color: #eb4d4b;
      }

      #cpu, #memory, #disk {
        padding: 0 8px;
        margin: 0 2px;
        border-radius: 3px;
      }

      #cpu {
        color: #8fbcbb;
      }

      #memory {
        color: #d08770;
      }

      #disk {
        color: #a3be8c;
      }

      #clock {
        padding: 0 10px;
        color: #ffffff;
      }

      #tray {
        padding: 0 10px;
        background-color: rgba(100, 114, 125, 0.3);
        border-radius: 3px;
        margin-right: 8px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
      }

      #tray menu {
        background-color: rgba(43, 48, 59, 0.9);
        border: 1px solid rgba(100, 114, 125, 0.5);
        border-radius: 5px;
        color: #ffffff;
      }

      #tray menuitem {
        padding: 4px 8px;
        color: #ffffff;
      }

      #tray menuitem:hover {
        background-color: rgba(100, 114, 125, 0.5);
      }
    '';
  };
}
