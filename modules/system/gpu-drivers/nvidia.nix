{
  flake.nixosModules.system-gpu-drivers-nvidia = {lib, ...}: {
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      modesetting.enable = true;
      open = true; # Для видеокарт старше RTX 20XX
      # open = false; # Для видеокарт младше RTX 20XX
    };

    hardware.nvidia-container-toolkit.enable = true; # Если нужно прокидывать nvidia GPU в docker
  };
}
