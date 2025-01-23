{ config, pkgs, inputs, username, ... }:
{
  # Import Program Configurations
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./programs
    ./shell

    ../scripts/default.nix
  ];

  # Home Manager Settings
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };

  # Set The Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes."catppuccin-mocha";

  # Define Settings For Xresources
  xresources.properties = {
    "Xcursor.size" = 24;
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
        enable = true;
        createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.home-manager.enable = true;
}
