{ config, pkgs, ... }:

{
  imports = [
    ./amd-gpu.nix
    ./appimages.nix
    ./autorun.nix
    ./boot.nix
    ./displaymanager.nix
    ./distrobox.nix
    ./flatpak.nix
    ./hwclock.nix
    ./intel-nvidia.nix
    ./kernel.nix
    ./logitech.nix
    ./nfs.nix
    ./ntp.nix
    ./packages.nix
    ./polkit.nix
    ./python.nix
    ./printer.nix
    ./services.nix
    ./steam.nix
    ./syncthing.nix
    ./vm.nix
  ];
}
