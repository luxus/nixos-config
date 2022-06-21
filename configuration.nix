{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix
    ./overlay.nix
    ./fonts.nix
    ./packages.nix
    ./env.nix
  ];

  # Allow Unfree pkgs
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  virtualisation.libvirtd.enable = true;

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # garbage collect
    gc = {
      automatic = true;
      options = "--delete-older-than 5d";
      dates = "Sun 14:00";
    };
    autoOptimiseStore = true;

    nixPath = [
      "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
      "nixos-config=/home/ocfox/nixos/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_lqx;
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  networking = {
    firewall.enable = false;
    hostName = "whitefox";
    useDHCP = false;

    interfaces.enp5s0.wakeOnLan.enable = true;

    networkmanager = {
      enable = true;
      # wifi.macAddress = "random";
      # ethernet.macAddress = "random";
    };
  };

  programs = {
    nm-applet.enable = true;
    steam.enable = false;
    gnupg.agent.enable = true;
    dconf.enable = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-chinese-addons
        fcitx5-configtool
        fcitx5-rime
      ];
    };
  };

  # xdg.portal = {
  #   enable = false;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };

  # Enable the X11 windowing system.
  services = {
    xserver = {
      layout = "us";
      # swap 'Caps Lock' & 'Escape'
      # xkbOptions = "caps:swapescape";

      windowManager.dwm.enable = true;
      dpi = 144;

      # windowManager.leftwm.enable = true;

      enable = true;
      videoDrivers = ["nvidia"];
      displayManager = {
        defaultSession = "none+dwm";
        autoLogin = {
          enable = true;
          user = "ocfox";
        };
        lightdm.enable = true;
      };
    };

    xrdp = {
      enable = false;
      defaultWindowManager = "dwm";
    };

    printing.enable = true;
    blueman.enable = true;
    openssh.enable = true;

    avahi = {
      enable = true;
      nssmdns = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };
  };

  hardware.video.hidpi.enable = true;

  # Enable sound.
  sound.enable = true;
  # Enable bluetooth
  hardware.bluetooth.enable = true;

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    tcp = {
      enable = true;
      anonymousClients.allowedIpRanges = ["127.0.0.1"];
    };
  };

  users.users.ocfox = {
    isNormalUser = true;
    extraGroups = ["wheel" "libvirtd"];
    shell = pkgs.fish;
  };

  environment.variables.EDITOR = "nvim";

  system.stateVersion = "unstable";
}
