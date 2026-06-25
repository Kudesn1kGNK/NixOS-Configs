{
  flake.nixosModules.systemd-boot = {...}: {
    boot = {
      plymouth.enable = true;

      loader = {
        systemd-boot.enable = true;
        systemd-boot.consoleMode = "auto";
        efi.canTouchEfiVariables = true;

        grub.enable = false;
      };
    };
  };
}
