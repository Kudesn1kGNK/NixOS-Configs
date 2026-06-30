{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.notebook = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostNotebook
    ];
  };

  flake.nixosModules.hostNotebook = {...}: {
    imports = [
      self.nixosModules.system
      self.nixosModules.systemd-boot

      self.nixosModules.system-gpu-drivers
      # self.nixosModules.system-gpu-drivers-nvidia
      # self.nixosModules.system-gpu-drivers-intel
      # self.nixosModules.system-gpu-drivers-amd

      self.nixosModules.desktop
      self.nixosModules.desktop-programs
      # self.nixosModules.desktop-programs-gaming
      self.nixosModules.desktop-programs-work

      self.nixosModules.shell-programs
      # self.nixosModules.shell-programs-work
    ];

    environment.sessionVariables.LIBGL_ALWAYS_SOFTWARE = "true";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    services.xserver.videoDrivers = ["modesetting" "nouveau"];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "26.05"; # Did you read the comment?
  };
}
