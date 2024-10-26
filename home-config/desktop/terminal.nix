{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tree
  ];

  programs = {
    bat.enable = true;
    lsd.enable = true;
    fastfetch.enable = true;

    zsh = {
      enable = true;
      # zsh as default shell is setted in system/users.nix

      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        custom = "$HOME/.oh-my-zsh/custom";
        theme = "powerlevel10k/powerlevel10k";
      };

      shellAliases = {
        vim = "nvim";
        si = "wezterm imgcat";
      };

      initExtra = ''

        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

        fastfetch -l small --color blue --title-color-at green --separator-output-color green -s title:separator:os:kernel:uptime:packages:cpuUsage:memory:disk:custom:colors
        
      '';
    };

    wezterm = {
      enable = true;
      extraConfig = ''

        local wezterm = require("wezterm")
        return {
          enable_wayland = false,
          font = wezterm.font_with_fallback({ "CaskaydiaCove Nerd Font" }),
          font_size = 12.0,
          color_scheme = "OneDark (base16)",
          hide_tab_bar_if_only_one_tab = true,
          window_close_confirmation = "NeverPrompt",
          use_fancy_tab_bar = false,
          colors = {
            tab_bar = {
              background = "#282c34",
              active_tab = {
                bg_color = "#c679dc",
                fg_color = "#000000",
              },
              inactive_tab = {
                bg_color = "#301d36",
                fg_color = "#abb3be",
              },
              inactive_tab_hover = {
                bg_color = "#301d36",
                fg_color = "#abb3be",
              },
              new_tab = {
                bg_color = "#301d36",
                fg_color = "#808080",
              },
              new_tab_hover = {
                bg_color = "#301d36",
                fg_color = "#808080",
              }
            }
          }
        }
        
      '';
    };
  };

  # powerlevel10k
  home.file.".oh-my-zsh/custom/themes/powerlevel10k".source = builtins.fetchGit {
      url = "https://github.com/romkatv/powerlevel10k.git";
  };
}