{ config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./plasma.nix
  ];
}
