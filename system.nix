{ config, lib, pkgs, ... }:

{
  # Basics
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

  environment.systemPackages = with pkgs; [
    unixtools.fdisk
    exfat
    usbutils
    pciutils
    efibootmgr
    htop
    pass
    git
    neovim
    emacs
    direnv
    alacritty
    firefox
    brave
    chromium
  ];

  boot.supportedFilesystems = [ "ntfs" ];

  programs.adb.enable = true;

  # Screenlock
  services.physlock = {
    enable = true;
    allowAnyUser = true;
  };

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
