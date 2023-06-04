{pkgs, ...}: {
  gh = {
    enable = true;
    extensions = with pkgs; [gh-markdown-preview];
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };
  exa = {
    enable = true;
    enableAliases = true;
  };
  direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  home-manager.enable = true;
  bash.enable = true;
  man.enable = true;
bat = {
    enable = true;
    config.theme = "base16";
  };
gitui = {
    enable = true;
  };
zellij = {
    enable = true;
  };
zoxide = {
    enable = true;
  };
  skim.enable = true;
}
