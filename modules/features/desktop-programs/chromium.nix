{
  flake.nixosModules.desktop-programs = {pkgs, ...}: {
    programs.chromium.enable = true;

    environment.systemPackages = with pkgs; [
      ungoogled-chromium
    ];
  };
}
