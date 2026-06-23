{
  flake.nixosModules.shell-programs-work = {
    pkgs,
    config,
    ...
  }: {
    virtualisation.docker.enable = true;

    environment.systemPackages = with pkgs; [
      docker-compose
    ];

    users.users.${config.preferences.user.name}.extraGroups = ["docker"];
  };
}
