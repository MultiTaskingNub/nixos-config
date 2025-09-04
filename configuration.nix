# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    <home-manager/nixos>
    ./modules/nvidia.nix
    ./modules/pkgs.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/firewall.nix
    ./modules/power.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_6_15;
  boot.kernelParams = [
    "pcie_aspm=force"
    "pcie_aspm=off"
  ];

  home-manager.users.multitasker = import ./home.nix;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  hardware.enableRedistributableFirmware = true;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  boot.extraModprobeConfig = ''
    options mt7921e disable_aspm=1
  '';
  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        Experimental = true; # Show battery charge of Bluetooth devices
      };
    };
  };
  # Set your time zone.
  time.timeZone = "Asia/Riyadh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.multitasker = {
    isNormalUser = true;
    description = "multitasker";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "kvm"
    ];
    packages = with pkgs; [
      kdePackages.kate
      #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "multitasker";

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];

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
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  services.xserver = {
    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks

      ];
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.plasma6.excludePackages = with pkgs.libsForQt5; [
    kwallet
  ];

  environment.shellAliases = {
    brave = "brave --password-store=basic";
  };


}
