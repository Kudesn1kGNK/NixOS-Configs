{
  flake.nixosModules.shell-programs = {pkgs, ...}: {
    programs.git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        credential.helper = "store";
      };
    };
  };
}
