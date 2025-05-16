{
  config,
  pkgs,
  inputs,
  ...
}:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
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
    #    --shell--    #
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
    grc
    oh-my-fish
    gnome-shell
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
