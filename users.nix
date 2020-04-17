{ config, pkgs, ... }:

{
  users.users.john = {
    isNormalUser = true;
    extraGroups = [ "wheel" "adbusers" ];
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
    ffmpeg
    imagemagick
    hugo

    # The Office
    libreoffice-fresh
    pandoc
    texlive.combined.scheme-context
    xournalpp
    (pidgin-with-plugins.override {
      plugins = [ pidgin-sipe ];
    })

    # Util
    rclone
    p7zip

    # Pesky IRC
    discord
    zoom-us

    # Vidya
    steam
    #steam-run-native
  ];
}
