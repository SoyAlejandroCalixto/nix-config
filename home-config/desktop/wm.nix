{ ... }:
{
  home.file = {
    # hyprland.conf
    ".config/hypr/hyprland.conf".text = ''

      source = ~/.config/hypr/binds.conf
      source = ~/.config/hypr/input.conf
      source = ~/.config/hypr/autostart.conf
      source = ~/.config/hypr/monitors.conf
      source = ~/.config/hypr/enviromentVariables.conf
      source = ~/.config/hypr/look.conf

    '';

    # autostart.conf
    ".config/hypr/autostart.conf".text = ''

      exec-once = systemctl --user start waybar
      exec-once = hyprpaper
      exec-once = clipse -listen
      exec-once = hyprctl setcursor Bibata-Modern-Classic 24
      exec-once = systemctl --user start polkit-kde-auth-agent

    '';

    # binds.conf
    ".config/hypr/binds.conf".text = ''

      # For more see -> https://wiki.hyprland.org/Configuring/Keywords/

      # Variables -->
      $terminal = wezterm
      $fileManager = wezterm -e ranger
      $browser = brave
      $code-editor = code
      $drun = rofi -show drun -drun-display-format {name}

      # Switch workspaces with SUPER + [0-9]
      bind = SUPER, 1, workspace, 1
      bind = SUPER, 2, workspace, 2
      bind = SUPER, 3, workspace, 3
      bind = SUPER, 4, workspace, 4
      bind = SUPER, 5, workspace, 5
      bind = SUPER, 6, workspace, 6
      bind = SUPER, 7, workspace, 7
      bind = SUPER, 8, workspace, 8
      bind = SUPER, 9, workspace, 9
      bind = SUPER, 0, workspace, 10

      # Window management -->
      bind = SUPER, F, togglefloating,
      bind = SUPER, P, pseudo, # dwindle
      bind = SUPER, S, togglesplit, # dwindle

      # Move focus with SUPER + h/j/k/l keys -->
      bind = SUPER SHIFT, left, movefocus, l
      bind = SUPER SHIFT, right, movefocus, r
      bind = SUPER SHIFT, down, movefocus, d
      bind = SUPER SHIFT, up, movefocus, u

      # Move focussed window to a workspace with SUPER + SHIFT + [0-9]
      bind = SUPER SHIFT, 1, movetoworkspace, 1
      bind = SUPER SHIFT, 2, movetoworkspace, 2
      bind = SUPER SHIFT, 3, movetoworkspace, 3
      bind = SUPER SHIFT, 4, movetoworkspace, 4
      bind = SUPER SHIFT, 5, movetoworkspace, 5
      bind = SUPER SHIFT, 6, movetoworkspace, 6
      bind = SUPER SHIFT, 7, movetoworkspace, 7
      bind = SUPER SHIFT, 8, movetoworkspace, 8
      bind = SUPER SHIFT, 9, movetoworkspace, 9
      bind = SUPER SHIFT, 0, movetoworkspace, 10

      # Move/resize windows with SUPER + LMB/RMB and dragging
      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow

      # Move windows with SUPER + h/j/k/l keys -->
      bind = SUPER ALT, left, movewindow, l
      bind = SUPER ALT, right, movewindow, r
      bind = SUPER ALT, down, movewindow, d
      bind = SUPER ALT, up, movewindow, u

      # Move windows to left/down/right/up monitor with SUPER + h/j/k/l keys -->
      bind = SUPER, left, movecurrentworkspacetomonitor, l
      bind = SUPER, right, movecurrentworkspacetomonitor, r
      bind = SUPER, down, movecurrentworkspacetomonitor, d
      bind = SUPER, up, movecurrentworkspacetomonitor, u

      # Resize windows with SUPER + CTRL + h/j/k/l keys -->
      bind = SUPER CTRL, left, resizeactive, -25 0
      bind = SUPER CTRL, right, resizeactive, 25 0
      bind = SUPER CTRL, up, resizeactive, 0 -25
      bind = SUPER CTRL, down, resizeactive, 0 25

      # Useful stuff -->
      bind = , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+
      bind = , XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%-
      bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind = , Print, exec, hyprshot -m region --clipboard-only
      bind = shift, Print, exec, hyprshot -m output --clipboard-only
      bind = SUPER, Q, killactive,
      bind = SUPER, V, exec, wezterm -e --class clipse -e 'clipse'
      bind = SUPER, E, exec, bemoji
      bind = SUPER, Space, exec, $drun

      # Launch apps -->
      bind = SUPER, return, exec, $terminal
      bind = SUPER SHIFT, E, exec, $fileManager
      bind = SUPER SHIFT, B, exec, $browser
      bind = SUPER SHIFT, C, exec, $code-editor

    '';

    # enviromentVariables.conf
    ".config/hypr/enviromentVariables.conf".text = ''

      # See https://wiki.hyprland.org/Configuring/Environment-variables/
      env = NIXPKGS_ALLOW_UNFREE,1

      env = XCURSOR_SIZE,24
      env = HYPRCURSOR_SIZE,24

      env = GTK_THEME,Adwaita:dark
      env = GTK2_RC_FILES,/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
      env = QT_STYLE_OVERRIDE,Adwaita-Dark

      # nvidia
      env = LIBVA_DRIVER_NAME,nvidia
      env = XDG_SESSION_TYPE,wayland
      env = GBM_BACKEND,nvidia-drm
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia

      cursor {
          no_hardware_cursors = true
      }

    '';

    # hyprpaper.conf
    ".config/hypr/hyprpaper.conf".text = ''

      preload = /home/kappy/.local/share/backgrounds/7.png
      wallpaper = , /home/kappy/.local/share/backgrounds/7.png

      # enable splash text rendering over the wallpaper
      # splash = true

      # fully disable ipc
      # ipc = off

    '';

    # input.conf
    ".config/hypr/input.conf".text = ''

      input {
          kb_layout = es
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1
          sensitivity = -0.75 # -1.0 - 1.0, 0 means no modification.

          touchpad {
              natural_scroll = false
          }
      }

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures {
          workspace_swipe = false
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device {
          name = epic-mouse-v1
          sensitivity = -0.5
      }

    '';

    # look.conf
    ".config/hypr/look.conf".text = ''

      # Refer to https://wiki.hyprland.org/Configuring/Variables/

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general {
          gaps_in = 5
          gaps_out = 5

          border_size = 2

          col.active_border = rgba(c678ddee) rgba(8d78ddee) 45deg
          col.inactive_border = rgba(595959aa)

          # Set to true enable resizing windows by clicking and dragging on borders and gaps
          resize_on_border = false

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false

          layout = dwindle
      }

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration {
          rounding = 12

          active_opacity = 1.0
          inactive_opacity = 1.0

          drop_shadow = false
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)

          blur {
              enabled = true
              size = 10
              passes = 1
              vibrancy = 0.1696
          }
      }

      animations {
          enabled = true

          # see https://wiki.hyprland.org/Configuring/Animations/
          animation = windows, 1, 3, default
          animation = windowsOut, 1, 3, default, popin 80%
          animation = border, 1, 5, default
          animation = borderangle, 1, 4, default
          animation = fade, 1, 3, default
          animation = workspaces, 1, 3, default
          animation = layers, 1, 0.001, default
      }

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle {
          pseudotile = true # Master switch for pseudotiling. Enabling is bound to SUPER + P in the keybinds section below
          preserve_split = true # You probably want this
      }

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master {
          new_status = master
      }

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc {
          force_default_wallpaper = -1
          disable_hyprland_logo = true # disables the random hyprland logo backgrounds
      }

      # windows and workspaces

      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

      # Example windowrule v1
      # windowrule = float, ^(kitty)$

      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

      windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.

      windowrulev2 = float,class:(clipse)
      windowrulev2 = size 622 652,class:(clipse)
      windowrulev2 = center,class:(clipse)

    '';

    # monitors.conf
    ".config/hypr/monitors.conf".text = ''

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=DP-1,1920x1080@75,0x0,1
      monitor=DVI-D-1,1920x1080@60,1920x0,1

    '';
  };
}