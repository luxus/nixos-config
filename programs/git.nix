{ config
, lib
, pkgs
, ...
}:
{
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "i@ocfox.me";
    userName = "ocfox";

    signing = {
      signByDefault = true;
      key = "939EF8A5CED87F505BB5B2D024BC27385F70234F";
    };
  };
}
