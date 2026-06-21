{
  flake.nixosModules.system-gpu-drivers-intel = {lib, ...}: {
    services.xserver.videoDrivers = ["modesetting"];
  };
}
