{
  flake.nixosModules.shell-programs-work = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vagrant
    ];
  };
}
