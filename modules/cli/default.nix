{ config, pkgs, ... }:

{
  imports = [
    ./nvim.nix
    ./git.nix
  ];
}
