{inputs, ...}: {
  flake.nixosModules.system = {config, ...}: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      users.${config.preferences.user.name} = {
        home.stateVersion = config.system.stateVersion;
      };
    };
  };
}
