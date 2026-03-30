{ pkgs, ... }:
{
  home-manager.users.kappy.programs = {
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
    zoxide.enable = true;
    atuin.enable = true;
    ranger = {
      enable = true;
      package = null;
      plugins = [
        {
          name = "ranger_devicons";
          src = pkgs.fetchFromGitHub {
            owner = "alexanderjeurissen"; repo = "ranger_devicons";
            rev = "1bcaff0366a9d345313dc5af14002cfdcddabb82"; hash = "sha256-qvWqKVS4C5OO6bgETBlVDwcv4eamGlCUltjsBU3gAbA=";
          };
        }
        {
          name = "ranger-archives";
          src = pkgs.fetchFromGitHub {
            owner = "maximtrp"; repo = "ranger-archives";
            rev = "0b1cfa9a77412c3b51da5b1b213c672227f9fbb4"; hash = "sha256-HEJ+8KlG++PK0vVpEYptbyuPZAKllX5PeyaTBKcf+8M=";
          };
        }
      ];
      extraConfig = ''
        default_linemode devicons
        set preview_images true
        set preview_images_method iterm2
      '';
    };
    wezterm.enable = true;
    wezterm.extraConfig = ''
      return {
        enable_wayland = false,
        window_background_opacity = 0.9,
        font = wezterm.font_with_fallback({ "CaskaydiaCove Nerd Font" }),
        font_size = 14,
        freetype_load_flags = "NO_HINTING",
        color_scheme = "Catppuccin Macchiato",
        window_close_confirmation = "NeverPrompt",
        use_fancy_tab_bar = false,
        hide_tab_bar_if_only_one_tab = true,
        window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
      }
    '';
  };
}
