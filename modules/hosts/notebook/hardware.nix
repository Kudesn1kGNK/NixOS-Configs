{self, ...}: {
  flake.nixosModules.hostNotebook = {...}: {
    imports = [
      "${self}/hardware-configuration.nix"
    ];
  };
}
