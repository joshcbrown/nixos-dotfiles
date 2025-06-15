{
  services.mako = {
    enable = true;

    # Appearance
    settings = {
      background-color = "#2b303b";
      text-color = "#ffffff";
      border-color = "#64727d";
      progress-color = "#8fbcbb";

      # Layout
      width = 350;
      height = 100;
      padding = "12";
      margin = "10";
      border-size = 2;
      border-radius = 8;

      # Position
      anchor = "top-right";

      # Behavior
      default-timeout = 5000; # 5 seconds
      ignore-timeout = true; # Allow manual dismissal
      max-visible = 5;
      sort = "-time"; # Newest first

      font = "Inter 12";

      icon-path = ""; # Use system icon theme
      max-icon-size = 32;

      group-by = "app-name";

      actions = true;
      "actionable=true" = { anchor = "top-left"; };
      "urgency=low" = {
        border-color = "#5e81ac";
        default-timeout = 3000;
      };

      "urgency=normal" = {
        border-color = "#64727d";
        default-timeout = 5000;
      };
      "urgency=critical" = {
        border-color = "#bf616a";
        default-timeout = 0;
        background-color = "#3b2838";
        text-color = "#ffffff";
      };
    };
  };

  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod SHIFT, N, exec, makoctl dismiss -all"
      "$mod CTRL, N, exec, makoctl restore"
      "$mod ALT, N, exec, makoctl menu dmenu"
    ];
  };
}
