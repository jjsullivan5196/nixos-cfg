{ config, pkgs, ... }:

{
  users.users.john = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # zsh
  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
  '';

  programs.zsh.promptInit = "";

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    # Multimedia
    vlc
    sxiv
    gimp
    inkscape
    blender

    # The Office
    libreoffice-fresh

    # Pesky IRC
    discord

    # Vidya
    #steam
    #steam-run-native
  ];
}
