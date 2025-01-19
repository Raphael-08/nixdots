{ config, lib, ... }:

let 
  nfs = false; 
in
  lib.mkIf (nfs == true) {
    fileSystems."/mnt/nas" = {
      device = "nas:/volume1/nas";
      fsType = "nfs";
    };
    services = {
      rpcbind.enable = true;
      nfs.server.enable = true;
    };
}
