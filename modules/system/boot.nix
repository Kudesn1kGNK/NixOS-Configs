{
  flake.nixosModules.system = {...}: {
    # Bootloader.
    boot.loader = {
      # efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
      };
    };
  };
}
