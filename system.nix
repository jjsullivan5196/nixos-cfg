{ config, lib, pkgs, ... }:

{
  # Basics
  programs.gnupg.agent.enable = true;

  environment.systemPackages = with pkgs; [
    pinentry-qt
    pass
    git
    neovim
    emacs
    alacritty
    firefox
  ];

  # Audio
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  # Automount
  services.devmon.enable = true;

  # Printers
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      hplip
    ];
  };

  # Local networking
  services.avahi = {
    enable = true;
    nssmdns = true;
    publish.addresses = true;
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };
}