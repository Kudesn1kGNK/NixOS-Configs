{
  flake.nixosModules.hostMain = {lib, ...}: {
    boot.initrd.availableKernelModules = ["sd_mod" "sr_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = [];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/488d2e6b-3795-4106-9411-45947e0c98e6";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/2F9B-1160";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    swapDevices = [];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    virtualisation.hypervGuest.enable = true;
  };
}
