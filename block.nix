{ config, lib, pkgs, ... }:

{
  # Get rid of these sites
  networking.hosts = {
    "0.0.0.0" = [
      # Reddit
      "reddit.com"
      "www.reddit.com"
      "old.reddit.com"
      "i.reddit.com"
    ];
  };
}
