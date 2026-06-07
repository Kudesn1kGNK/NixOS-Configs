{ config, pkgs, ... }:

{
  imports = [
    ./nvim.nix
    ./cargo.nix
    ./git.nix
  ];
}
