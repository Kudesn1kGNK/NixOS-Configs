{
  flake.nixosModules.system = {lib, ...}: {
    services.xserver.xkb = lib.mkDefault {
      layout = "us,ru";
      variant = ",";
      options = "grp:ctrl_shift_toggle";
    };
  };
}
