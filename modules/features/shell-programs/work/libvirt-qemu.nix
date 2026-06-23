{
  flake.nixosModules.shell-programs-work = {
    pkgs,
    config,
    ...
  }: {
    virtualisation.libvirtd = {
      enable = true;
      # qemu = {
      #   swtpm.enable = true; # для работы TPM под Windows 11
      # };
    };

    users.users.${config.preferences.user.name}.extraGroups = [
      "libvirtd"
    ];

    environment.systemPackages = with pkgs; [
      qemu_kvm
      libvirt
      virt-manager
    ];
  };
}
