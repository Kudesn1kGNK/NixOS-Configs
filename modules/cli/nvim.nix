{ config, pkgs, ... }:

{
  # Define nerd-fonts for icons
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
  ];

  # nix-ld for regular nvim Mason configuration
  programs.nix-ld.enable = true;

  # Set nvim as default editor
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";
  };

  # Keep env on sudo
  security.sudo.extraConfig = ''
    Defaults env_keep+="SSH_TTY SSH_CONNECTION EDITOR VISUAL SUDO_EDITOR"
  '';

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    ripgrep
    fd
    gcc
    curl
    nodejs_26
    tree-sitter
    lazygit
  ];
}
