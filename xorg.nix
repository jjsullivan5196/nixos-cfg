{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    compton
    hsetroot
    sxhkd
    dmenu
    polybar
  ];

  fonts = { 
    fonts = with pkgs; [
      hack-font
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      dejavu_fonts
      liberation_ttf
    ];

    enableDefaultFonts = true;
    enableGhostscriptFonts = true;

    fontconfig = {
      penultimate.enable = false;
      defaultFonts = {
        monospace = [ "Hack" "Noto Sans Mono"  ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };

  qt5 = {
    enable = true;
    style = "adwaita";
    platformTheme = "gnome";
  };
  
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    windowManager.bspwm.enable = true;
  };
}
