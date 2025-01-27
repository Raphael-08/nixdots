{
  pkgs,
  config,
  lib,
  ...
}:

let
  kdenlive = false;
in
lib.mkIf (kdenlive == true) {
  home.packages = with pkgs; [
    pkgs.kdenlive
  ];
}
