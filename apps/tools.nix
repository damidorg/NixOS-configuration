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
    kanata-with-cmd
    unzip
    virtualboxKvm
    kvmtool
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
    tlrc
    uutils-coreutils-noprefix
    which
    ripgrep
    bat
    zoxide
    zellij
    starship
    carapace

    #    --System--    #
    nh
    rar
    rar2fs
    du-dust
    #j    flameshot
    #  (flameshot.override { enableWlrSupport = true; })
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
    rustlings
    rusty-man
    #    --embeded--    #
    probe-rs-tools
    openocd
    qemu_full
    gdb
    cargo-generate
  ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged
    # programs here, NOT in environment.systemPackages
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

  #    --wireshark--    #
  programs.wireshark = {
    enable = true;

  };
  users.groups.wireshark = { };

}
