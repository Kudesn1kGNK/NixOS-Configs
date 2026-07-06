{
  flake.nixosModules.desktop = {...}: {
    services.xserver.enable = true;

    services.displayManager.sddm.enable = true;
  };
}
