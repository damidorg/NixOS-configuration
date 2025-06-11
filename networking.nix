{
  config,
  pkgs,
  inputs,
  ...
}:
{
  #    --netnetworking--    #
  networking.hostName = "damidorg-nix";
  services.gnome.gnome-keyring.enable = true; # Optional: For credential storage
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    haguichi
    logmein-hamachi
    wget
    curl
    tailscale
    cloudflare-warp
    localsend
  ];
  networking.nftables.enable = true;
  #    --tailscale--    #
  services.tailscale.enable = true;
  networking.firewall = {
    checkReversePath = "loose"; # Required for Tailscale
    trustedInterfaces = [ "tailscale0" ]; # Trust Tailscale interface
  };
  #    --localsend--    #
  programs.localsend.openFirewall = true;

  #    --hamachi--    #
  services.logmein-hamachi.enable = true;
  #    --warp 1.1.1.1--    #
  services.cloudflare-warp.enable = true;

}
