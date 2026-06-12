{self, ...}: {
  flake.nixosModules.hostMain = {...}: {
    imports = [
      "${self}/hardware-configuration.nix"
    ];
  };
}
