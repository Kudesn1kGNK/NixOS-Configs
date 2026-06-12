{
  flake.nixosModules.desktop-programs = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      telegram-desktop
    ];
  };
}
