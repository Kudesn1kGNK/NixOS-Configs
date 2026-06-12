{
  flake.nixosModules.desktop = {pkgs, ...}: {
    programs.niri.enable = true;
    environment.systemPackages = with pkgs; [
      noctalia-shell
    ];
  };
}
