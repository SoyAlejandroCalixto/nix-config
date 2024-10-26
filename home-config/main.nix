{ ... }:
{
  imports = [
    ./desktop/gtk.nix
    ./desktop/notifications.nix
    ./desktop/panel.nix
    ./desktop/runner.nix
    ./desktop/terminal.nix
    ./desktop/wm.nix
    ./apps/vscode.nix
  ];
}