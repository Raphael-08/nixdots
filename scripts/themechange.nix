{ pkgs, ... }:
pkgs.writeShellScriptBin "themechange" ''
  if [[ ! $@ ]];then
    echo "No Theme Given"
  else
    replacement="$1"
    sed -i "/^\s*theme[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$replacement\"/" ${userHome}/nixdots/options.nix
    kitty -e pkexec nixos-rebuild switch --flake ${userHome}/nixdots
  fi
''
