{
  flake.nixosModules.system-gpu-drivers = {lib, ...}: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
