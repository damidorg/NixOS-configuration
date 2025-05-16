{
  cofig,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    ghostty
    obs-studio
    wireshark
    btop-cuda
    ciscoPacketTracer8
    pinta
    kismet
    aircrack-ng
    audacity
    reaper
    spicetify-cli
    testdisk
    jujutsu
    kanata-with-cmd
    unzip
    #    --System--    #
    coreutils-full
    desktop-file-utils
    nh
    rar
    rar2fs
    #flameshot
    #(flameshot.override { enableWlrSupport = true; })
    #    --programing--    #
    rust-analyzer
    nixd
    evil-helix
    nixfmt-rfc-style
    clang
    lldb
    rustup
    tree-sitter-grammars.tree-sitter-rust
    tree-sitter

  ];
  #    --kanata--    #
  boot.kernelModules = [ "uinput" ];

  hardware.uinput.enable = true;

  services.udev.extraRules = ''KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput" '';
  users.groups.uinput = { };

  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  #    --spotify--    #
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      theme = spicePkgs.themes.default;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
    };
  #    --wireshark--    #
  programs.wireshark = {
    enable = true;

  };
  users.groups.wireshark = { };

}
