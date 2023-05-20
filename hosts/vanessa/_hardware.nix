{ config
, lib
, modulesPath
, ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    extraModulePackages = with pkgs; [ config.boot.kernelPackages.v4l2loopback.out ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ "kvm-intel" "v4l2loopback" ];
    };

  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/fe0ecfb9-db21-43f0-915a-70c37765f181";
    fsType = "btrfs";
  };
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };

  swapDevices = [ ];

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.opengl.enable = true;
  hardware.keyboard.qmk.enable = true;
}
