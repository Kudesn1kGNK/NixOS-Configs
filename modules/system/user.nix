{
  flake.nixosModules.system = {
    config,
    lib,
    ...
  }: {
    options.preferences.user.name = lib.mkOption {
      type = lib.types.str;
      default = "artyo";
    };

    config = {
      users.users.${config.preferences.user.name} = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager"];

        initialPassword = "123";
      };
    };

  };
}
