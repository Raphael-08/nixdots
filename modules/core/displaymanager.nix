{ pkgs, config, ... }:
{
  services = {
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "tokyo-night-sddm";
    };
  };

  environment.systemPackages =
    let
      sugar = pkgs.callPackage ../styles/sddm-sugar-dark.nix {};
      tokyo-night = pkgs.libsForQt5.callPackage ../styles/sddm-tokyo-night.nix {};
    in 
    [ 
      sugar.sddm-sugar-dark # Name: sugar-dark
      tokyo-night # Name: tokyo-night-sddm
      pkgs.libsForQt5.qt5.qtgraphicaleffects
    ];
}
