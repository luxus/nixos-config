{ pkgs, inputs, username, ... }: {
  imports = [

    ];
  time.timeZone = "Europe/Amsterdam";

  hardware.bluetooth.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
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
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
#  xdg.configFile."xkb/symbols/us-german-umlaut" = {
#    text = ''
#      default partial alphanumeric_keys
#      xkb_symbols "basic" {
#      include "us(altgr-intl)"
#      include "level3(caps_switch)"
#      name[Group1] = "English (US, international with German umlaut)";
#      key <AD03> { [ e, E, EuroSign, cent ] };
#      key <AD07> { [ u, U, udiaeresis, Udiaeresis ] };
#      key <AD09> { [ o, O, odiaeresis, Odiaeresis ] };
#      key <AC01> { [ a, A, adiaeresis, Adiaeresis ] };
#      key <AC02> { [ s, S, ssharp ] };
#      key <ESC> {[Caps_Lock]};
#      key <CAPS> {[Escape]};
#
#       };
#    '';
#  };
  sound.enable = true;
  system.stateVersion = "23.05";
}
