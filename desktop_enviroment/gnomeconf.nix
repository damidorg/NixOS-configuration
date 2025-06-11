{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    #    --gnomeExtensions--    #
    gnomeExtensions.blur-my-shell
    gnomeExtensions.user-themes
    gnomeExtensions.clipboard-history
    gnomeExtensions.gsconnect
    gnomeExtensions.appindicator
    gnomeExtensions.color-picker
    gnomeExtensions.invert-window-color
    gnomeExtensions.highlight-focus
    gnomeExtensions.tiling-assistant
    gnome-tweaks
    gnome-common
    gnome-remote-desktop
  ];
  environment.gnome.excludePackages = with pkgs; [
    orca
    evince
    # file-roller
    #geary
    #gnome-disk-utility
    seahorse
    # sushi
    # gnome-shell-extensions
    #
    # adwaita-icon-theme
    # nixos-background-info
    # gnome-backgrounds
    # gnome-bluetooth
    # gnome-color-manager
    #gnome-control-center
    #gnome-shell-extensions
    gnome-tour # GNOME Shell detects the .desktop file on first log-in.
    gnome-user-docs
    # glib # for gsettings program
    # gnome-menus
    # gtk3.out # for gtk-launch program
    # xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/
    # xdg-user-dirs-gtk # Used to create the default bookmarks
    #
    #baobab
    epiphany
    gnome-text-editor
    #gnome-calculator
    #gnome-calendar
    #gnome-characters
    # gnome-clocks
    #gnome-console
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    # gnome-system-monitor
    gnome-weather
    # loupe
    # nautilus
    # gnome-connections
    simple-scan
    #snapshot
    #totem
    yelp
    #gnome-software
  ];

}
