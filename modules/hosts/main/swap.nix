{
  flake.nixosModules.hostMain = {...}: {
    swapDevices = [
      {
        device = "/swapfile";
        size = 8192;
      }
    ];
  };
}
