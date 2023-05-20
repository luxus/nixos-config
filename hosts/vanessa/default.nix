{ pkgs
, username
, ...
}: {
  time.timeZone = "Europe/Amsterdam";

  hardware.bluetooth.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;
    #hashedPassword = "$6$jVI2tdENaEqUyZGh$rni.joO5US9t9RYM9wlIvia4L1YOObs44Kt3gBcooBJTeSFGyEorciM2CrKMEnzbojpi1KgPPe256i5Q46N1d0";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/AjBtg8D4lMoBkp2L3dDb5EmkOGr1v/Ns1wwRoKds4"
    ];
    extraGroups = [
      "wheel"
      "docker"
      "libvirtd"
    ];
  };

  system.stateVersion = "23.05";
}
