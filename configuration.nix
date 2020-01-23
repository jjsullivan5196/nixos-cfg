{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware-configuration.nix
    ./box.nix
    ./system.nix
    ./users.nix
    ./xorg.nix
  ];
}
