{
  flake.nixosModules.desktop = {...}: {
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us,ru";
      variant = ",";
      options = "grp:ctrl_shift_toggle";
    };
  };
}
