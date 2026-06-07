nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko -- --mode destroy,format,mount ./disko.nix
nixos-generate-config --root /mnt
cp -f /mnt/etc/nixos/hardware-configuration.nix .
nixos-install --flake .#nixos
