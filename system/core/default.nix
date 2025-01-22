{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./configuration.nix
    ./displaymanager.nix
    ./hyprland.nix
    ./logitech.nix
    ./nfs.nix
    ./nh.nix
    ./nix.nix
    ./packages.nix
    ./polkit.nix
    ./printer.nix
    ./programs.nix
    ./python.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./users.nix
    ./vm.nix
  ];
}
