{ pkgs, ... }: {
excludePackages = with pkgs.libsForQt5; [
  elisa
  gwenview
  okular
  oxygen
  khelpcenter
  konsole
  plasma-browser-integration
  print-manager
];
}
