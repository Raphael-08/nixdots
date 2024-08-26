{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [ inputs.zen-browser.packages."${system}".default ];
}