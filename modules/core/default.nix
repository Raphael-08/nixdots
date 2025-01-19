{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./configuration.nix
    ./displaymanager.nix
    ./nfs.nix
    ./nix.nix
    ./polkit.nix
    ./printer.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./users.nix
    ./vm.nix
  ];
}
