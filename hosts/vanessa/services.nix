{ username }:
{
  pcscd.enable = true;
  getty.autologinUser = username;
  devmon.enable = true;
  #  printing.enable = true;
  blueman.enable = true;
  openssh.enable = true;

  pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  #  tailscale.enable = true;
}
