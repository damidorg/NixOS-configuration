{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    fastfetch
    obsidian
    libreoffice
    telegram-desktop
    discord-canary
    firefox
    flatpak
  ];
  services.flatpak.enable = true;
  programs.fish.enable = true;
  environment.variables.TERMINAL = "ghostty";
}
