{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware-configuration.nix
    ./box.nix
    ./users.nix
    ./xorg.nix
    ./packages-basics.nix
  ];
}
