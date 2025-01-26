{ pkgs, inputs, username, ... }:
{
  # Install Packages For The User
  home.packages = with pkgs; [
    libvirt 
    swww 
    grim 
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


    # web dev
    corepack_23
    nodejs_23
    go
  ];

  programs.gh.enable = true;
}
