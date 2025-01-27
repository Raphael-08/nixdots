{ pkgs, ... }:
let
  wallsetter = pkgs.writeScriptBin "wallsetter" (builtins.readFile ../scripts/wallsetter.sh);

  runbg = pkgs.writeShellScriptBin "runbg" (builtins.readFile ../scripts/runbg.sh);
  # music = pkgs.writeShellScriptBin "music" (builtins.readFile ../scripts/music.sh);
  # lofi = pkgs.writeScriptBin "lofi" (builtins.readFile ../scripts/lofi.sh);
  rofi-launcher = pkgs.writeScriptBin "rofi-launcher" (builtins.readFile ../scripts/rofi-launcher.sh);

  toggle_oppacity = pkgs.writeScriptBin "toggle_oppacity" (
    builtins.readFile ../scripts/toggle_oppacity.sh
  );
  toggle_waybar = pkgs.writeScriptBin "toggle_waybar" (builtins.readFile ../scripts/toggle_waybar.sh);
  toggle_float = pkgs.writeScriptBin "toggle_float" (builtins.readFile ../scripts/toggle_float.sh);

  compress = pkgs.writeScriptBin "compress" (builtins.readFile ../scripts/compress.sh);
  extract = pkgs.writeScriptBin "extract" (builtins.readFile ../scripts/extract.sh);

  show-keybinds = pkgs.writeScriptBin "show-keybinds" (builtins.readFile ../scripts/keybinds.sh);

  # vm-start = pkgs.writeScriptBin "vm-start" (builtins.readFile ../scripts/vm-start.sh);

  record = pkgs.writeScriptBin "record" (builtins.readFile ../scripts/record.sh);

  screenshot = pkgs.writeScriptBin "screenshot" (builtins.readFile ../scripts/screenshot.sh);

  # rofi-power-menu = pkgs.writeScriptBin "rofi-power-menu" (
  #   builtins.readFile ../scripts/rofi-power-menu.sh
  # );
  # power-menu = pkgs.writeScriptBin "power-menu" (builtins.readFile ../scripts/power-menu.sh);

  nvidia-offload = pkgs.writeScriptBin "nvidia-offload" (
    builtins.readFile ../scripts/nvidia-offload.sh
  );
in
{
  home.packages = with pkgs; [

    wallsetter

    runbg
    # music
    # lofi
    rofi-launcher

    toggle_oppacity
    toggle_waybar
    toggle_float

    compress
    extract

    show-keybinds

    # vm-start

    record

    screenshot

    # rofi-power-menu
    # power-menu

    nvidia-offload

    (import ../scripts/task-waybar.nix { inherit pkgs; })
  ];
}
