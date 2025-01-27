{
  pkgs,
  config,
  lib,
  ...
}:

let
  logitech = false;
in
lib.mkIf (logitech == true) {
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
}
