{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pass
    git
    neovim
    emacs
    alacritty
    firefox
  ];
}
