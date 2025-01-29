{
  pkgs,
  username,
  ...
}:
let
  command = "bin/nbfc_service --config-file '/home/${username}/.config/nbfc.json'";
in
{
  environment.systemPackages = with pkgs; [
    # if you are on stable uncomment the next line
    # inputs.nbfc-linux.packages.x86_64-linux.default
    # if you are on unstable uncomment the next line
    nbfc-linux
  ];

  system.activationScripts.createNbfcConfig = ''
    mkdir -p /home/${username}/.config
    echo '{"SelectedConfigId": "Acer Predator PH315-54"}' > /home/${username}/.config/nbfc.json
    chown ${username}:users /home/${username}/.config/nbfc.json
  '';

  systemd.services.nbfc_service = {
    enable = true;
    description = "NoteBook FanControl service";
    serviceConfig.Type = "simple";
    path = [ pkgs.kmod ];

    # if you are on stable uncomment the next line
    #  script = "${inputs.nbfc-linux.packages.x86_64-linux.default}/${command}";
    # if you are on unstable uncomment the next line
    script = "${pkgs.nbfc-linux}/${command}";

    wantedBy = [ "multi-user.target" ];
  };
}
