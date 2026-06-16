{
  flake.nixosModules.shell-programs = {pkgs, ...}: {
    programs.nh = {
      enable = true;
      flake = "/etc/nixos";
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
        dates = "daily";
      };
    };
  };
}
