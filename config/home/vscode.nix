{
  pkgs,
  lib,
  ...
}: 
{
  programs.vscode = {
    enable = true;
    extensions = (with pkgs.vscode-extensions; [
      # python
      ms-python.python
      # Color theme
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      brettm12345.nixfmt-vscode
    ]) ++ (let unstable = import <nixos-unstable> { };
    in [ unstable.vscode-extensions.ms-vsliveshare.vsliveshare ]);
    # native titlebar causes vscode to crash, remove for vscode 1.86
    # https:i//github.com/microsoft/vscode/issues/184124#issuecomment-1717959995
  };
}
