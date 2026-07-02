{
  flake.nixosModules.shell-programs = {pkgs, ...}: {
    programs.git = {
      enable = true;
      config = {
        pull.rebase = true;
        init.defaultBranch = "main";
        # credential.helper = "store";
      };
    };
  };
}
