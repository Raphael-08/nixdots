{ pkgs, config, lib, ... }:

let
  inherit (import ../../options.nix) python;
  my-python-packages = ps: with ps; [
    pandas
    requests
    setuptools
    torch
    diffusers
    jupyter
    notebook
    matplotlib
    seaborn
    accelerate
    transformers
  ];
in lib.mkIf (python == true) {
  environment.systemPackages = with pkgs; [
    (pkgs.python3.withPackages my-python-packages)
  ];
}
