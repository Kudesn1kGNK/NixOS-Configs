{
  flake.nixosModules.shell-programs = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      yazi
    ];
  };
}
