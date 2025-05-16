{
  config,
  pkgs,
  inputs,
  ...
}:
{
  #    --nvidia-driver--    #
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {

    modesetting.enable = true;

    powerManagement.enable = true;

    powerManagement.finegrained = true;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  hardware.nvidia.prime = {
    offload.enable = true;
    offload.enableOffloadCmd = true;

    # sync.enable = true;

    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  #    --kernal--    #
  boot.kernelPackages = pkgs.linuxPackages_zen;

  #    --System-conf--    #
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
    ./desktop_enviroment/timelocale.nix
    ./desktop_enviroment/gui.nix
    ./desktop_enviroment/gnomeconf.nix
    ./desktop_enviroment/sound.nix
    ./apps/games.nix
    ./apps/tools.nix
    ./apps/apps.nix
    inputs.spicetify-nix.nixosModules.default
  ];

  #    --Bootloader--    #
  boot.loader = {
    timeout = 5;

    efi = {
      efiSysMountPoint = "/boot";
    };

    grub = {
      enable = true;

      efiSupport = true;
      efiInstallAsRemovable = true; # Otherwise /boot/EFI/BOOT/BOOTX64.EFI isn't generated
      devices = [ "nodev" ];
      extraEntriesBeforeNixOS = true;
    };
  };

  boot.loader.grub.extraInstallCommands = ''
    cat << EOF >> /boot/grub/grub.cfg

      # Shutdown
      menuentry "Shutdown" --class shutdown {
        halt
      }

      # Reboot
      menuentry "Reboot" --class restart{
        reboot
      }
      EOF
  '';

  boot.loader.grub2-theme = {
    enable = true;
    theme = "vimix";
    footer = true;
  };
  services.printing.enable = true;
  security.rtkit.enable = true;

  services.xserver.excludePackages = [
    pkgs.xterm
    pkgs.helix
  ];
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
  # Or disable the firewall altogether.
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
