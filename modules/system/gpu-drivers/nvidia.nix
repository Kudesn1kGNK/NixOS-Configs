{
  flake.nixosModules.system-gpu-drivers-nvidia = {lib, ...}: {
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      modesetting.enable = true;
      open = true; # Для современных видеокарт старше RTX 20XX
      # open = false; # Для устаревших видеокарт младше RTX 20XX
    };
  };
}
