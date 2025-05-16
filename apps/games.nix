{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    steam-run
    lutris
    qbittorrent
    bottles
    shadps4
    mangohud

  ];
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    fontPackages = with pkgs; [ source-han-sans ];
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfersi
  };
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
  hardware.xone.enable = true; # support for the xbox controller USB dongle
  services.getty.autologinUser = "damidorg";
  environment = {
    loginShellInit = ''
      [[ "$(tty)" = "/dev/tty1" ]] && ./gs.sh
    '';
  };

}
