{
  flake.nixosModules.system = {...}: {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    programs.nix-ld.enable = true;
    nixpkgs.config.allowUnfree = true;
  };
}
