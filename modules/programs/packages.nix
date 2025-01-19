{ pkgs, inputs, username, ... }:
{
  # Install Packages For The User
  home.packages = with pkgs; [
    libvirt 
    swww 
    grim 
    slurp 
    file-roller
    swaynotificationcenter 
    rofi-wayland 
    imv 
    transmission_4-gtk
    mpv
    gimp 
    obs-studio 
    rustup 
    audacity 
    pavucontrol
    vscode
    tree 
    protonup-qt
    font-awesome 
    swayidle 
    vlc
    vscode
    zoxide
    glxinfo
    (ollama.override { acceleration = "cuda";})
    inputs.zen-browser.packages.${pkgs.system}.default
    # Import Scripts
    (import ../../scripts/emopicker9000.nix { inherit pkgs; })
    (import ../../scripts/task-waybar.nix { inherit pkgs; })
    (import ../../scripts/squirtle.nix { inherit pkgs; })
    (import ../../scripts/wallsetter.nix { inherit pkgs; inherit username;})
    (import ../../scripts/themechange.nix { inherit pkgs; inherit username;})
    (import ../../scripts/theme-selector.nix { inherit pkgs; })
    (import ../../scripts/nvidia-offload.nix { inherit pkgs; })
    (import ../../scripts/web-search.nix { inherit pkgs; })
    (import ../../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ../../scripts/screenshootin.nix { inherit pkgs; })
    (import ../../scripts/list-hypr-bindings.nix { inherit pkgs; })
  ];

  programs.gh.enable = true;
}
