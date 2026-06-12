{
  flake.nixosModules.desktop-programs = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      v2rayn
    ];
  };
}
