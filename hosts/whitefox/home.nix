{ pkgs
, config
, ...
}: {
  imports = [
    ../../programs
    ../../services
    ../../scripts
  ];

  gtk = {
    enable = true;
    theme = {
      package = pkgs.materia-theme;
      name = "Materia";
    };

    iconTheme = {
      package = pkgs.numix-icon-theme-circle;
      name = "Numix-Circle";
    };
  };

  # xsession.enable = true;

  # services.pasystray.enable = true;
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.nur.repos.ambroisie.vimix-cursors;
    name = "Vimix-white-cursors";
    size = 42;
  };

  programs.home-manager.enable = true;
  programs.mako = {
    enable = true;
    backgroundColor = "#2b3339";
    borderSize = 1;
    borderColor = "#83b6af";
    defaultTimeout = 5000;
    font = "JetBrainsMono Nerd Font 12";
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [ obs-studio-plugins.wlrobs ];
  };

  home.packages = with pkgs; [
    # aseprite-unfree
    bitwarden
    waybar
    foot
    wl-clipboard
    swayidle
    showmethekey
    gh

    lolcat
    tree
    element-desktop
    qbittorrent
    tdesktop

    firefox-wayland
    qutebrowser

    factorio-experimental

    # Music & Video
    spotify
    spotify-tui
    spotifyd
    sptlrx
    playerctl
    cava
    vlc
    wf-recorder

    # Application
    nur.repos.linyinfeng.icalingua-plus-plus
    screenkey

    julia-bin
    texlive.combined.scheme-medium
  ];
  home.stateVersion = "22.05";
}