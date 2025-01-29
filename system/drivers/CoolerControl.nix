{ pkgs, ... }:
{
  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };
  systemd = {
    packages = with pkgs.coolercontrol; [
      coolercontrol-liqctld
      coolercontrold
    ];
  };
}
