{ config, lib, pkgs, ... }:

let
  custom-emacs = pkgs.emacsWithPackages (with pkgs.emacsPackagesNg; [
    emacs-libvterm
  ]);
in
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
    custom-emacs
    direnv
    dos2unix
    alacritty
    firefox
    brave
    chromium
  ];

  boot.supportedFilesystems = [ "ntfs" "btrfs" ];

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
    package = pkgs.pulseaudioFull;
  };

  # OpenGL ThirtyTwo
  hardware.opengl.driSupport32Bit = true;

  # Steam controllers?
  hardware.steam-hardware.enable = true;

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

  networking.firewall.allowedTCPPorts = [ 80 8080 8081 1313 ];

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };
}
