{ pkgs, ... }:
{
  home-manager.users.kappy.programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      adpyke.codesnap
      usernamehw.errorlens
      meganrogge.template-string-converter
      vscodevim.vim
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      { name = "vscord"; publisher = "leonardssh"; version = "5.3.9"; sha256 = "sha256-DZlIlxFEI4h5304771yZgQt6FiNVCqgzlH2qe1B1Riw=";}
      { name = "highlight-on-copy"; publisher = "mguellsegarra"; version = "1.1.0"; sha256 = "sha256-slepPjJJsdktzPAxpuPqKg1bOWWv9LctTzsmoB1R/Mg=";}
      { name = "vscode-gutter-preview"; publisher = "kisstkondoros"; version = "0.32.2"; sha256 = "sha256-JIr4UGuwy9Z5oH8D8elGMBGP8s40pYLCEZGmJAO5Ga0=";}
      { name = "symbols"; publisher = "miguelsolorio"; version = "0.0.25"; sha256 = "sha256-nhymeLPfgGKyg3krHqRYs2iWNINF6IFBtTAp5HcwMs8=";}
      { name = "vscode-thunder-client"; publisher = "rangav"; version = "2.39.13"; sha256 = "sha256-rDbU8N60FUd5sjnFpj/XXwXkrdHDWI+BpURbxugELPw=";}
    ];

    profiles.default.userSettings = {
      "window.zoomLevel" = 0.5;
      "window.titleBarStyle" = "native";
      "window.customTitleBarVisibility" = "never";
      "window.menuBarVisibility" = "hidden";
      "editor.fontFamily" = "CaskaydiaCove Nerd Font";
      "editor.fontSize" = 16;
      "editor.fontLigatures" = true;
      "editor.fontVariations" = true;
      "editor.minimap.enabled" = false;
      "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
      "editor.scrollbar.verticalScrollbarSize" = 7;
      "editor.scrollbar.horizontalScrollbarSize" = 7;
      "editor.smoothScrolling" = true;
      "editor.stickyScroll.enabled" = false;
      "editor.linkedEditing" = true;
      "editor.cursorBlinking" = "expand";
      "editor.inlayHints.enabled" = "offUnlessPressed";
      "editor.formatOnSave" = false;
      "terminal.integrated.fontSize" = 12;
      "terminal.integrated.commandsToSkipShell" = [ "workbench.action.closePanel" ];
      "breadcrumbs.enabled" = false;
      "workbench.sideBar.location" = "right";
      "workbench.activityBar.location" = "top";
      "workbench.iconTheme" = "symbols";
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "scm.diffDecorationsGutterWidth" = 5;
      "emmet.includeLanguages" = { javascript = "javascriptreact"; };
      "codesnap.showLineNumbers" = false;
      "codesnap.showWindowControls" = false;
      "codesnap.target" = "window";
      "vscord.app.name" = "Visual Studio Code";
      "vscord.status.idle.enabled" = false;
      "vscord.status.showElapsedTime" = false;
      "vscord.status.details.enabled" = false;
      "vscord.status.state.enabled" = false;
      "vscord.status.image.small.notInFile.text" = "Programando...";
      "vscord.status.image.large.notInFile.key" = "https://i.imgur.com/nGfsJPm.png";
      "vscord.status.image.small.notInFile.key" = "https://i.imgur.com/nGfsJPm.png";
      "errorLens.enabledDiagnosticLevels" = [ "error" "info" ];
      "vim.sneak" = true;
      "vim.easymotion" = true;
      "vim.incsearch" = true;
      "vim.useSystemClipboard" = true;
      "vim.hlsearch" = true;
      "vim.leader" = "<space>";
      "vim.insertModeKeyBindingsNonRecursive" = [
        { before = [ "j" "k" ]; after = [ "<Esc>" ]; }
      ];
      "vim.normalModeKeyBindingsNonRecursive" = [
        { before = [ "u" ]; commands = [ "undo" ]; }
        { before = [ "<C-r>" ]; commands = [ "redo" ]; }
        { before = [ "<leader>" "t" ]; commands = [ "workbench.view.explorer" ]; }
        { before = [ "<leader>" "s" ]; commands = [ "workbench.action.terminal.toggleTerminal" ]; }
        { before = [ "<leader>" "a" ]; commands = [ "workbench.panel.chat" ]; }
        { before = [ "<leader>" "f" ]; commands = [ "workbench.action.quickOpen" ]; }
        { before = [ "<leader>" "g" ]; commands = [ "workbench.action.findInFiles" ]; }
      ];
      "vim.visualModeKeyBindingsNonRecursive" = [
        { before = [ "=" ]; commands = [ "editor.action.reindentselectedlines" "extension.vim_escape" ]; }
      ];
      "extensions.experimental.affinity" = { "vscodevim.vim" = 1; };
    };

    profiles.default.keybindings = [
      {
        key = "ctrl+right"; command = "-editor.action.inlineSuggest.acceptNextWord";
        when = "inlineSuggestionVisible && !editorReadonly";
      }
      {
        key = "alt+left"; command = "cursorHome";
        when = "editorTextFocus";
      }
      {
        key = "alt+right"; command = "cursorEnd";
        when = "editorTextFocus";
      }
      {
        key = "ctrl+."; command = "workbench.action.previousEditor";
        when = "editorTextFocus";
      }
      {
        key = "ctrl+-"; command = "workbench.action.nextEditor";
        when = "editorTextFocus";
      }
      { key = "ctrl+h"; command = "workbench.action.navigateLeft"; }
      { key = "ctrl+l"; command = "workbench.action.navigateRight"; }
      { key = "ctrl+j"; command = "workbench.action.navigateDown"; }
      { key = "ctrl+k"; command = "workbench.action.navigateUp"; }
      {
        key = "ctrl+n"; command = "explorer.newFile";
        when = "explorerViewletFocus && !inputFocus";
      }
      {
        key = "ctrl+e"; command = "workbench.action.closeSidebar";
        when = "explorerViewletFocus";
      }
      {
        key = "ctrl+e"; command = "workbench.action.closePanel";
        when = "terminalFocus";
      }
      {
        key = "ctrl+e"; command = "workbench.action.closeAuxiliaryBar";
        when = "auxiliaryBarFocus";
      }
      {
        key = "ctrl+shift+e"; command = "runCommands";
        args = {
          commands = [
            "workbench.action.closeSidebar"
            "workbench.action.closePanel"
            "workbench.action.closeAuxiliaryBar"
          ];
        };
      }
      { key = "ctrl+w"; command = "workbench.action.closeActiveEditor"; }
    ];
  };
}
