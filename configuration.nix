{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware.nix
    ./box.nix
    ./users.nix
    ./xorg.nix
    ./pkg-basics.nix
    ./pkg-user.nix
  ];
}
