{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Code stuff
    docker
    gnumake
    rust
    clang
    adoptopenjdk-openj9-bin-11
    python3
    nodejs-11_x
    yarn

    # Multimedia
    vlc
    sxiv
    gimp
    inkscape
    blender
    spotify

    # The Office
    libreoffice-fresh

    # The Innernet
    qutebrowser
    firefox

    # Pesky IRC
    discord

    # Vidya
    steam
    steam-run-native
  ];
}
