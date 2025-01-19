{ pkgs, hostname, ... }:
{
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    git
    wget
    curl
  ];
  
  #Allow allowUnfree Packages
  nixpkgs.config.allowUnfree = true;

  # Define your hostname
  networking = {
    hostName = "${hostname}";
    # Enable networking
    networkmanager.enable = true;
  };

  # Set your time zone
  time.timeZone = "Asia/Kolkata";
  console.keyMap = "us";

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "${theLCVariables}";
    LC_IDENTIFICATION = "${theLCVariables}";
    LC_MEASUREMENT = "${theLCVariables}";
    LC_MONETARY = "${theLCVariables}";
    LC_NAME = "${theLCVariables}";
    LC_NUMERIC = "${theLCVariables}";
    LC_PAPER = "${theLCVariables}";
    LC_TELEPHONE = "${theLCVariables}";
    LC_TIME = "${theLCVariables}";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    # bye bye xterm
    excludePackages = [ pkgs.xterm ];
  };

  system.stateVersion = "23.11";
}
