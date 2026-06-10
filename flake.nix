{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";

    username = "artyo";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit username;
      };

      modules = [
        ./nixos/configuration.nix

        home-manager.nixosModules.default

        {
          home-manager.extraSpecialArgs = {
            inherit username;
          };

          home-manager.users.${username} = import ./hm/default.nix;
        }
      ];
    };
  };
}
