{ config, pkgs, lib, ... }:

{
  imports = [ <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> ];

  # By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
  # If you prefer another desktop manager or display manager, you may want
  # to disable the default.
  services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
  services.xserver.displayManager.sddm.enable = lib.mkForce false;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";
}
