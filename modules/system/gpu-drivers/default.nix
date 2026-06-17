{
  flake.nixosModules.system = {lib, ...}: {
    hardware.graphics.enable = true;
  };
}
