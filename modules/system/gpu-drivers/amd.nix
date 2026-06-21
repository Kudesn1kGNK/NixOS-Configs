{
  flake.nixosModules.system-gpu-drivers-amd = {lib, ...}: {
    services.xserver.videoDrivers = ["amdgpu"];
    boot.initrd.kernelModules = ["amdgpu"];
  };
}
