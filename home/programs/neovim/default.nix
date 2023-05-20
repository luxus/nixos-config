{ pkgs, ... }:
{
  enable = true;
  vimAlias = true;
  vimdiffAlias = true;
  defaultEditor = true;
  #  plugins = with pkgs.vimPlugins; [
  #    (nvim-treesitter.withPlugins (
  #      plugins: with plugins; [
  #        nix
  #        lua
  #        rust
  #        c
  #        go
  #        hcl
  #      ]
  #   ))
  #];
  # extraConfig = ''
  #  :source ${./nvim.lua}
  # '';
}
