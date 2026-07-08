{inputs, ...}: {
  flake.nixosModules.desktop = {config, ...}: {
    imports = [
      inputs.driftwm.nixosModules.default
    ];

    programs.driftwm.enable = true;

    home-manager.users.${config.preferences.user.name} = {
      programs.swaylock.enable = true;
    };
  };
}
