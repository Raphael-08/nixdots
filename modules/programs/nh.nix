{ pkgs, username, ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/${username}/nixdots";
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
