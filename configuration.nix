{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./users.nix
    ./xorg.nix
    ./packages-basics.nix
  ];
}
