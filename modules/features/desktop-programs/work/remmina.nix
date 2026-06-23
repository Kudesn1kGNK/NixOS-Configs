{
  flake.nixosModules.desktop-programs-work = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      remmina
    ];
  };
}
