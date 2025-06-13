{ config, pkgs, lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      # "HYPRCURSOR_THEME,${cursorName}"
      "HYPRCURSOR_SIZE,${toString 16}"
      # See https://github.com/hyprwm/contrib/issues/142
      "GRIMBLAST_NO_CURSOR,0"
    ];

    exec-once = [
      # finalize startup
      "uwsm finalize"
      # set cursor for HL itself
      # "hyprctl setcursor ${cursorName} ${toString 16}"
      # "hyprlock"
    ];

    monitor = [ "DP-1,1920x1080@144,0x0,1" ];

    general = {
      gaps_in = 4;
      gaps_out = 8;
      border_size = 3;
      allow_tearing = true;
      resize_on_border = true;
    };

    decoration = {
      rounding = 10;
      rounding_power = 3;
      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 1.0e-2;

        vibrancy = 0.2;
        vibrancy_darkness = 0.5;

        passes = 4;
        size = 7;

        popups = true;
        popups_ignorealpha = 0.2;
      };

      shadow = {
        enabled = true;
        ignore_window = true;
        offset = "0 15";
        range = 100;
        render_power = 2;
        scale = 0.97;
      };
    };

    animations.enabled = true;

    animation = [
      "border, 1, 2, default"
      "fade, 1, 4, default"
      "windows, 1, 3, default, popin 80%"
      "workspaces, 1, 2, default, slide"
    ];

    group = {
      groupbar = {
        font_size = 10;
        gradients = false;
      };
    };

    input = {
      kb_layout = "us";
      follow_mouse = 1;
      accel_profile = "flat";
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = 0;

      # disable dragging animation
      animate_mouse_windowdragging = false;

      # enable variable refresh rate (effective depending on hardware)
      # vrr = 1;
    };

    render.direct_scanout = true;

    # touchpad gestures
    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };

    permission = [
      # Allow xdph and grim
      #"${config.programs.hyprland.portalPackage}/libexec/.xdg-desktop-portal-hyprland-wrapped, screencopy, allow"
      "${lib.getExe pkgs.grim}, screencopy, allow"
      # Optionally allow non-pipewire capturing
      "${lib.getExe pkgs.wl-screenrec}, screencopy, allow"
    ];

    xwayland.force_zero_scaling = true;

    debug.disable_logs = false;
  };
}
