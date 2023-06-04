{ config, ... }:
let hostname = config.networking.hostName;
in
{
  boot.initrd = {
    luks.devices."${hostname}" = {
      device = "/dev/disk/by-label/${hostname}_crypt";
      allowDiscards = true;
      keyFileSize = 4096;
      # pinning to /dev/disk/by-id/usbkey works
      keyFile = "/dev/sda";
    };
    # ssh setup
    availableKernelModules = [ "e1000e" ];
    network.enable = true;
    network.ssh = {
      enable = true;
      port = 22;
      authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/AjBtg8D4lMoBkp2L3dDb5EmkOGr1v/Ns1wwRoKds4" ];
      hostKeys = [ "/etc/secrets/initrd/ssh_host_rsa_key" "/etc/secrets/initrd/ssh_host_ed25519_key" ];
    };
  };
}
