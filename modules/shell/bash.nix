{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Configure Bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
    profileExtra = ''
      #if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      #  exec Hyprland
      #fi
    '';
    initExtra = ''
      neofetch
      if [ -f $HOME/.bashrc-personal ]; then
        source $HOME/.bashrc-personal
      fi
    '';
    sessionVariables = {
      ZANEYOS = true;
      FLAKEBACKUP = "/home/${username}/.nixdots-backup";
      FLAKEPREV = "/home/${username}/.nixdots-previous";
    };
    shellAliases = {
      sv = "sudo nvim";
      rebuild = "nh os switch --hostname ${hostname}";
      update = "nh os switch --hostname ${hostname} --update";
      gcCleanup = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      v = "nvim";
      ls = "lsd";
      ll = "lsd -l";
      la = "lsd -a";
      lal = "lsd -al";
      ".." = "cd ..";
      neofetch = "neofetch --ascii ~/.config/ascii-neofetch";
    };
  };
}
