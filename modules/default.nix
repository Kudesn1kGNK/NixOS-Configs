{ config, pkgs, ... }:

{
  imports = [
    ./cli
    ./desktop
    ./network.nix
  ];
}
