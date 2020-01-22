{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Multimedia
    vlc
    sxiv
    gimp
    inkscape
    blender
    spotify

    # The Office
    libreoffice-fresh

    # Pesky IRC
    discord

    # Vidya
    steam
    steam-run-native
  ];
}
