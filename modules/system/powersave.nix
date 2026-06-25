{
  flake.nixosModules.system = {pkgs, ...}: {
    services.power-profiles-daemon.enable = true;
    services.thermald.enable = true;
    powerManagement.powertop.enable = true;
  };
}
