{ pkgs, config, ... }:

{
  # Place Files Inside Home Directory
  home.file = {
    ".emoji".source = ../../files/emoji;
    ".base16-themes".source = ../../files/base16-themes;
    ".face".source = ../../files/face.jpg; # For GDM
    ".face.icon".source = ../../files/face.jpg; # For SDDM
    ".config/starship.toml".source = ../../files/starship.toml;
    ".config/swaylock-bg.jpg".source = ../../files/media/swaylock-bg.jpg;
    ".config/ascii-neofetch".source = ../../files/ascii-neofetch;
    ".config/wlogout/icons" = {
      source = ../../files/wlogout;
      recursive = true;
    };
    ".local/share/fonts" = {
      source = ../../files/fonts;
      recursive = true;
    };
    ".config/obs-studio" = {
      source = ../../files/obs-studio;
      recursive = true;
    };
  };
}
