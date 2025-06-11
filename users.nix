{
  config,
  pkgs,
  inputs,
  ...
}:
{
  #    --user-damidorg--    #
  users.defaultUserShell = pkgs.fish;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  users.users.damidorg = {
    isNormalUser = true;
    description = "damidorg";
    extraGroups = [
      "networkmanager"
      "wheel"
      "wireshark"
      "input"
      "uinput"
    ];
  };
}
