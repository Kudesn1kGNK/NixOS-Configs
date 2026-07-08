{
  flake.nixosModules.shell-programs = {
    pkgs,
    config,
    ...
  }: let
    user = config.preferences.user.name;

    dotfiles = pkgs.fetchFromGitHub {
      owner = "Kudesn1kGNK";
      repo = "dotfiles";
      rev = "fe36262819d7e0befc27eb705bb6ff317fb708ac";
      hash = "sha256-7wh5RwmjD5AQrjc1QxnUtf9f3Kw2t0cj+aSKPAOmMGY=";
    };
  in {
    home-manager.users.${user} = {
      xdg.configFile."yazi".source = "${dotfiles}/yazi";
    };

    systemd.tmpfiles.rules = [
      "d /root/.config 0755 root root -"

      "L+ /root/.config/yazi - - - - ${dotfiles}/yazi"
    ];

    environment.systemPackages = with pkgs; [
      yazi
    ];
  };
}
