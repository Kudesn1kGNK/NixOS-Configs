{
  flake.nixosModules.desktop = {...}: {
    services.xserver.enable = true;

    services.displayManager.sddm.enable = true;

    services.xserver.xkb = {
      layout = "us,ru";
      variant = ",";
      options = "grp:ctrl_shift_toggle";
    };
  };
}
