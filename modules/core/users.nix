{ pkgs, username, theShell, ... }:
{
  users = {
    mutableUsers = true;
    users."${username}" = {
      homeMode = "755";
      hashedPassword = "$6$18JKFnAP84d62vB.$63g0TDv22PItmkWhnh26yctPwwi5K.4x48CSHnNs11bxY0yKw/setlgeCB/pePMuCEYYgoqdN9pjFLWRQ9ZXR/";
      isNormalUser = true;
      description = "Raphael-08";
      extraGroups = [ 
        "networkmanager" 
        "wheel" 
        "libvirtd" 
      ];
      shell = pkgs.${theShell};
      ignoreShellProgramCheck = true;
      packages = with pkgs; [];
    };
  };
}