{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  # NVIDIA GPU SEUTP 
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [
    "nvidia"];
    hardware.nvidia = {
    
     modesetting.enable = true;
     powerManagement.enable = false;
     powerManagement.finegrained = false;
     open = true;
     nvidiaSettings = true;
     package = config.boot.kernelPackages.nvidiaPackages.latest;
      prime = {
           sync.enable = true;

           intelBusId  = "PCI:0:2:0";
           nvidiaBusId = "PCI:1:0:0";
     };
};


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  powerManagement.cpuFreqGovernor = "performance";
  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_6_14;
  boot.kernelModules = [ "mt7921e" ];
  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.wireless.iwd.enable = true;
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;
  networking.networkmanager.wifi.backend = "iwd";
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
    jack.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.multitasker = {
    isNormalUser = true;
    description = "MultiTasker";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "multitasker";

  # Install firefox.
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     lf
     protonup
     kitty
     dmidecode
     feh
     fzf
     brave
     rofi
     papirus-icon-theme
     maim
     xclip
     pavucontrol
     tree
     git
     starship
     polybar
     prismlauncher
     zathura
  ];


    environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  system.stateVersion = "25.05"; # Did you read the comment?

  # programs 
  programs.starship.enable = true;
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.xwayland.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  services.picom.enable = true;
  environment.pathsToLink = ["/libexec"];
  programs.direnv.enable = true;
services.flatpak.enable = true;
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


 fonts.packages = with pkgs;[ 
 nerd-fonts.jetbrains-mono
];


   environment.plasma6.excludePackages = with pkgs.libsForQt5; [
   kwallet
];


   environment.shellAliases = {
   brave = "brave --password-store=basic";
}; 

}

