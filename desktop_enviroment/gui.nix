{
  config,
  pkgs,
  inputs,
  ...
}:
{
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];
  environment.systemPackages = with pkgs; [
    #    --system--    #
    rose-pine-cursor
    home-manager
    adwaita-qt
    qt6.full
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # Fixes OpenURI and cursor themes in flatpaks
    config = {
      # example with hyprland
      gnome.preferred = [
        "hyprland"
        "gtk"
      ];
    };
  };
}
