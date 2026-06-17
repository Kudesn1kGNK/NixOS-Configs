{inputs, ...}: {
  flake.nixosModules.desktop-programs = {
    pkgs,
    config,
    ...
  }: let
    user = config.preferences.user.name;

    prismAccounts = pkgs.writeText "accounts.json" (builtins.readFile ./accounts.json);
  in {
    environment.systemPackages = [
      inputs.nixpkgs-prism9.legacyPackages.${pkgs.stdenv.hostPlatform.system}.prismlauncher
    ];

    systemd.tmpfiles.rules = [
      "d /home/${user}/.local/share/PrismLauncher 0755 ${user} users - -"

      "L+ /home/${user}/.local/share/PrismLauncher/accounts.json - - - - ${prismAccounts}"
    ];
  };
}
