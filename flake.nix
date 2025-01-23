{
  description = "Rapahel-08";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-grub = {
      url = "github:catppuccin/grub";
      flake = false;
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprmag.url = "github:SIMULATAN/hyprmag";

    hypr-contrib.url = "github:hyprwm/contrib";
  };

  outputs = 
    inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "mrv";
      hostname = "HanMa";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in 
    {
      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem {
            specialArgs = { 
              inherit system; 
              inherit inputs; 
              inherit username; 
              inherit hostname;
          };
          modules = [ 
            ./system
            home-manager.nixosModules.home-manager 
            {
              home-manager.extraSpecialArgs = {
                inherit username; 
                inherit inputs;
                inherit hostname;
                inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
                };
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  backupFileExtension = "backup";
                  users.${username} = import ./modules/default.nix;
                };
            }
          ];
        };
      };
    };
}
