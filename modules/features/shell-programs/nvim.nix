{
  flake.nixosModules.shell-programs = {
    pkgs,
    config,
    ...
  }: let
    user = config.preferences.user.name;

    nvimConfig = pkgs.fetchFromGitHub {
      owner = "Kudesn1kGNK";
      repo = "LazyVim-Config";
      rev = "23ff7b2d71ea0822f2d02daf6a62e82a6157fb13";
      hash = "sha256-9qhQEY9r1mXPdWdB5jdMGTKNkU++HhFIhxu8tw75g6M=";
    };
  in {
    systemd.tmpfiles.rules = [
      "d /home/${user}/.config 0755 ${user} users -"
      "d /root/.config 0755 root users -"

      "L+ /home/${user}/.config/nvim - - - - ${nvimConfig}"
      "L+ /root/.config/nvim - - - - ${nvimConfig}"
    ];

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    environment.systemPackages = with pkgs; [
      tree-sitter
      lazygit
      ripgrep
      unzip
      curl
      gcc
      fd
    ];
  };
}
