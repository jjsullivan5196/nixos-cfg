{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware-configuration.nix
    ./box.nix
    ./kernel.nix
    ./system.nix
    ./block.nix
    ./users.nix
    ./xorg.nix
  ];
}
