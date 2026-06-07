nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko -- --mode destroy,format,mount ./disko.nix
nixos-generate-config --no-filesystems --root /mnt
cp -f /mnt/etc/nixos/hardware-configuration.nix ./nixos
nixos-install --max-jobs 1 --flake .#nixos
