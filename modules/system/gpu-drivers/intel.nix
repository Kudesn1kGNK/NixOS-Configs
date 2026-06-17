{
  flake.nixosModules.system = {lib, ...}: {
    services.xserver.videoDrivers = [
      "modesetting"
    ];
  };
}
