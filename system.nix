{ config, lib, pkgs, ... }:

{
  # Basics
  programs.gnupg.agent.enable = true;

  environment.systemPackages = with pkgs; [
    unixtools.fdisk
    usbutils
    pciutils
    pinentry-qt
    pass
    git
    neovim
    emacs
    direnv
    alacritty
    firefox
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];

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
    publish = {
      enable = true;
      domain = true;
      addresses = true;
    };
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };
}
