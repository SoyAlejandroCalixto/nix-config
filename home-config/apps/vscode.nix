{ ... }:
{
  programs.vscode = {
    enable = true;

    userSettings = {
      window.titleBarStyle = "custom";
      window.customTitleBarVisibility = "auto";
      window.menuBarVisibility = "toggle";
      window.zoomLevel = 1;
      editor.fontFamily = "CaskaydiaCove Nerd Font";
      editor.fontSize = 14;
      editor.fontLigatures = true;
      editor.fontVariations = true;
      editor.minimap.enabled = false;
      editor.scrollbar.verticalScrollbarSize = 0;
      workbench.startupEditor = "none";
      editor.smoothScrolling = true;
      editor.stickyScroll.enabled = false;
      editor.linkedEditing = true;
      editor.cursorBlinking = "expand";
      terminal.integrated.fontSize = 12;
      workbench.layoutControl.enabled = false;
      workbench.sideBar.location = "right";
      workbench.activityBar.location = "top";
      workbench.colorTheme = "One Dark Pro Darker";
      workbench.iconTheme = "material-icon-theme";
      workbench.productIconTheme = "fluent-icons";
      breadcrumbs.enabled = false;
      emmet.includeLanguages.javascript = "javascriptreact";
      git.autofetch = true;
      git.openRepositoryInParentFolders = "never";
      oneDarkPro.bold = true;
      oneDarkPro.italic = true;
      oneDarkPro.vivid = true;
      codesnap.showLineNumbers = false;
      codesnap.showWindowControls = false;
      codesnap.target = "window";
      vscord.app.name = "Visual Studio Code";
      vscord.status.idle.enabled = false;
      vscord.status.problems.enabled = false;
      vscord.status.showElapsedTime = false;
      vscord.status.details.enabled = false;
      vscord.status.details.idle.enabled = false;
      vscord.status.details.text.notInFile = "";
      vscord.status.details.text.idle = "";
      vscord.status.state.enabled = false;
      vscord.status.state.idle.enabled = false;
      vscord.status.image.small.idle.text = "";
      vscord.status.image.small.notInFile.text = "Programando...";
      vscord.status.image.large.notInFile.key = "https://i.imgur.com/nGfsJPm.png";
      vscord.status.image.small.notInFile.key = "https://i.imgur.com/nGfsJPm.png";
      vscord.status.buttons.button1.git.idle.enabled = false;
      vscord.status.buttons.button1.git.inactive.enabled = false;
      vscord.status.buttons.button1.git.active.enabled = false;
      vscord.status.buttons.button1.enabled = false;
      security.workspace.trust.untrustedFiles = "open";
      nix.enableLanguageServer = true;
      nix.serverPath = "nil";
    };

    keybindings = [
      {
        key = "ctrl+right";
        command = "-editor.action.inlineSuggest.acceptNextWord";
        when = "inlineSuggestionVisible && !editorReadonly";
      }
      {
        key = "alt+left";
        command = "cursorHome";
        when = "editorTextFocus";
      }
      {
        key = "alt+right";
        command = "cursorEnd";
        when = "editorTextFocus";
      }
      {
        key = "shift+tab";
        command = "editor.action.inlineSuggest.commit";
        when = "inlineSuggestionHasIndentationLessThanTabSize && inlineSuggestionVisible && !editorHoverFocused && !editorTabMovesFocus && !suggestWidgetVisible";
      }
      {
        key = "tab";
        command = "-editor.action.inlineSuggest.commit";
        when = "inlineSuggestionHasIndentationLessThanTabSize && inlineSuggestionVisible && !editorHoverFocused && !editorTabMovesFocus && !suggestWidgetVisible";
      }
    ];
  };
}