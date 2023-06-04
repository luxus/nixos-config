 { # GNOME
 enable = true;

  #desktopManager.gnome.enable = true;
  desktopManager.plasma5 = { 
 useQtScaling = true;
 enable = true; };
  displayManager = { 
  # gdm.enable = true;
  autoLogin.enable = true;
  autoLogin.user = "luxus";
  sddm.enable = true;
  # GDM uses wayland by default, but I don't want to
  #gdm.wayland = true;
  };
}
