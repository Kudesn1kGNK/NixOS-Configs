{
  flake.nixosModules.hostNotebook = {...}: {
    swapDevices = [
      {
        device = "/swapfile";
        size = 8192;
      }
    ];
  };
}
