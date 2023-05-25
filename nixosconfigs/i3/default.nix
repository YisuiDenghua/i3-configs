{ config, pkgs, lib, ... }:


{
  environment.systemPackages = with pkgs; [
    alacritty # gpu accelerated terminal
    i3-rounded
    picom-jonaburg
    xborders
    
    xdg-utils # for opening default programs when clicking links
    glib # gsettings
    polybar
    gnome3.adwaita-icon-theme  # default gnome cursors
    dmenu
    grim # screenshot functionality
    slurp # screenshot functionality
    autotiling
    dmenu-rs # wayland clone of dmenu
    mako # notification system developed by swaywm maintainer
    wdisplays # tool to configure displays
    cinnamon.nemo
    networkmanager_dmenu
    feh
    i3status-rust
    i3blocks-gaps
    shutter #screenshot
  ];


  services.pipewire = {
    enable = false;

    alsa.enable = true;
    pulse.enable = true;
  };


  programs.light.enable = true;

  # xdg-desktop-portal works by exposing a series of D-Bus interfaces
  # known as portals under a well-known name
  # (org.freedesktop.portal.Desktop) and object path
  # (/org/freedesktop/portal/desktop).
  # The portal interfaces include APIs for file access, opening URIs,
  # printing and others.
  services.dbus.enable = true;
  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   # gtk portal needed to make gtk apps happy
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };

  # enable sway window manager
  services.xserver.windowManager.i3 = 
  {
    enable = true;
    package = pkgs.i3-rounded;
    configFile = ./config;
  };
}
