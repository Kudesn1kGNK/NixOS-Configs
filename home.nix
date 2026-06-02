{ pkgs, username, ... }:

{
  home.username = username;

  home.homeDirectory =
    if username == "root"
    then "/root"
    else "/home/${username}";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    kdePackages.kate
    htop
    git
  ];
}
