{ pkgs, ... }:
{
  home-manager.users.kappy.programs = {
    zoxide.enable = true;
    atuin.enable = true;
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        vim = "nvim";
        ls = "lsd";
        cat = "bat";
        rls = "/run/current-system/sw/bin/ls";
        rcat = "/run/current-system/sw/bin/cat";
      };
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "zsh-autopair";
          src = pkgs.zsh-autopair;
          file = "share/zsh/zsh-autopair/autopair.zsh";
        }
      ];
      initContent = ''
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
    };
    wezterm.enable = true;
    wezterm.extraConfig = ''
      local wezterm = require 'wezterm'
      wezterm.on('update-right-status', function(window, pane)
        local cwd = tostring(pane:get_current_working_dir())
        cwd = cwd:gsub("file://", "")
        cwd = cwd:gsub("/home/"..os.getenv("USER"), "~")
        cwd = " "..cwd.." 󰝰 "

        local hostname = wezterm.hostname()
        hostname = " "..hostname.."  "

        local packages = "???"
        local handle = io.popen("nix-store -qR /run/current-system | wc -l")
        if handle then
          packages = handle:read("*a")
          packages = packages:gsub("\n", "")
          packages = " "..packages.." 󰏖 "
        end

        local uptime = "??:??"
        handle = io.popen("uptime")
        if handle then
          uptime = handle:read("*a")
          uptime = uptime:gsub("\n", "")
          uptime = uptime:gsub(".*arriba%s+(%d+:%d+),.*", "%1")
          uptime = " "..uptime.." 󰥔 "
        end

        local elements = {
          { Foreground = { Color = "#c6a0f6" } },
          { Text = utf8.char(0xe0b2) },
          { Foreground = { Color = "#000000" } },
          { Background = { Color = "#c6a0f6" } },
          { Text = cwd },
          { Foreground = { Color = "#8aadf4" } },
          { Text = utf8.char(0xe0b2) },
          { Foreground = { Color = "#000000" } },
          { Background = { Color = "#8aadf4" } },
          { Text = hostname },
          { Foreground = { Color = "#c6a0f6" } },
          { Text = utf8.char(0xe0b2) },
          { Foreground = { Color = "#000000" } },
          { Background = { Color = "#c6a0f6" } },
          { Text = packages },
          { Foreground = { Color = "#8aadf4" } },
          { Text = utf8.char(0xe0b2) },
          { Foreground = { Color = "#000000" } },
          { Background = { Color = "#8aadf4" } },
          { Text = uptime },
        }
        window:set_right_status(wezterm.format(elements))
      end)

      return {
        enable_wayland = false,
        window_background_opacity = 0.9,
        font = wezterm.font_with_fallback({ "CaskaydiaCove Nerd Font" }),
        font_size = 14,
        freetype_load_flags = "NO_HINTING",
        color_scheme = "Catppuccin Macchiato",
        window_close_confirmation = "NeverPrompt",
        use_fancy_tab_bar = false,
        window_padding = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        },
        colors = {
          tab_bar = {
            background = "#21222c",
            active_tab = { bg_color = "#c6a0f6", fg_color = "#000000" },
            inactive_tab = { bg_color = "#25074B", fg_color = "#c6a0f6" },
            inactive_tab_hover = { bg_color = "#25074B", fg_color = "#c6a0f6"},
            new_tab = { bg_color = "#25074B", fg_color = "#c6a0f6" },
            new_tab_hover = { bg_color = "#25074B", fg_color = "#c6a0f6" },
          },
        },
      }
    '';
  };
}
