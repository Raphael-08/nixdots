_: {
  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    NIXPKGS_ALLOW_UNFREE = 1;
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    SDL_VIDEODRIVER = "x11";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    MOZ_ENABLE_WAYLAND = 1;
    WLR_NO_HARDWARE_CURSORS = 1;
  };
}
