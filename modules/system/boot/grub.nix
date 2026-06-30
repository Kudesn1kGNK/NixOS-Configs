{
  flake.nixosModules.grub-boot = {...}: {
    boot.loader = {
      systemd-boot.enable = false;
      # efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
        useOSProber = true;
      };
    };
  };
}
