{
  flake.nixosModules.desktop-programs-gaming = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      steam-run
      steamtinkerlaunch
    ];
    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        protontricks.enable = true;
      };
    };
  };
}
