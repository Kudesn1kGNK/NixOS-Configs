#!/usr/bin/env bash
set -euo pipefail

nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko -- --mode destroy,format,mount ./nixos/disko.nix
nixos-generate-config --no-filesystems --root /mnt
cp -f /mnt/etc/nixos/hardware-configuration.nix ./nixos
rm -rf /mnt/etc/nixos
cp -af . /mnt/etc/nixos

fallocate -l 8G /mnt/swapfile
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile

nixos-install --max-jobs 1 --flake .#nixos
