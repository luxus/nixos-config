{ pkgs, ... }:
with pkgs;
[
  wget
  git
  screenfetch
  neofetch
  feh
  exa
  bat
  tty-clock
  lazygit
  fzf
  ouch
  htop
  bottom
  screen
  ripgrep
  fd
  acpi
  rsync
  aria2
  openssl
  gdu
  # neovim stuff
  unzip
  gnumake
  gcc
  lemonade # copy in ssh?
 # wl-copy
 # cmake do i need it?
  nodejs_20
  tree-sitter
# nix 
  deadnix
  nil
  statix
 # rust
 rust-analyzer
  clippy
  rustc
  cargo
  # lua
  stylua
  selene
  lua-language-server
# shell
  shellcheck
  # rustdesk
  comma
  python311
  (python311.withPackages (ps: with ps; [ pynvim pip ]))


]
