{self, ...}: {
  flake.nixosModules.system = {...}: {
    system.configurationRevision = self.rev or self.dirtyRev or null;
  };
}
