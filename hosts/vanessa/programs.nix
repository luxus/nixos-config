{
  git.enable = true;
  nm-applet.enable = true;
  gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
    enableSSHSupport = true;
  };
  nix-index.enable = true;
  command-not-found.enable = false;
  fish = {
    useBabelfish = true;
    enable = true;
  };
  zsh.enable = true;
  dconf.enable = true;
  thefuck.enable = true;
}
