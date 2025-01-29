{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # for wallsetter script
    libnotify

    # for screenshootin
    slurp
    swappy

    # minecraft launcher
    prismlauncher

    # java
    jdk

    # for cooler control
    lm_sensors

  ];
}
