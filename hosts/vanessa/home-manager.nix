{ username
, home
, inputs
}:
{
  useGlobalPkgs = true;
  useUserPackages = true;
  users.${username} = {
    imports = [
      home.default
      home.desktop
      inputs.hyprland.homeManagerModules.default
    ];
  };
  extraSpecialArgs = { inherit username; };
}
