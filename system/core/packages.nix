{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # for wallsetter script
    libnotify
  ];
}