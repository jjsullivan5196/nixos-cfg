{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xmodmap
    compton
    hsetroot
    sxhkd
    dmenu
    scrot
    xclip
    gnome3.adwaita-icon-theme
    (polybar.override { pulseSupport = true; })
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
        monospace = [ "Hack" "Noto Sans Mono" "DejaVu Sans Mono"  ];
        sansSerif = [ "Noto Sans" "DejaVu Sans" ];
        serif = [ "Noto Serif" "DejaVu Serif" ];
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
