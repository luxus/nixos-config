{ config
, lib
, modulesPath
, pkgs
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
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };
   boot.kernelParams = [ "module_blacklist=i915" ];
  hardware = {
cpu.intel.updateMicrocode = true;
    nvidia.prime.nvidiaBusId = "1@0:0:0";
    nvidia.prime.intelBusId = "0@0:2:0";
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ ];
      driSupport = true;
      driSupport32Bit = true;
    };

  };

  virtualisation.libvirtd = {
    enable = true;
  };
}
