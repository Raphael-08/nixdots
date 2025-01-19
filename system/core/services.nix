{ pkgs, config, lib, ... }:

{
  # List services that you want to enable:
  services = {
    openssh.enable = true;
    fstrim.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    gnome.gnome-keyring.enable=true;
    tlp.enable = true;
    libinput.enable = true;
    flatpak.enable = false;
  };

  networking.networkmanager.wifi.powersave = true;
  powerManagement.enable = true;

  programs.thunar.enable = true;

  systemd.services.flatpak-repo = {
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
