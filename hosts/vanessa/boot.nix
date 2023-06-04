{ pkgs }:
{
  plymouth.enable = true;
  loader = {
    grub2-theme = {
      enable = true;
      theme = "vimix";
      screen = "ultrawide2k";
    };
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };
  #very slow boot
 # kernelParams = [ "ip=dhcp" ];
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
}
