{ username
, nixpkgs
, home
, inputs
, ...
}:
let
  module = { pkgs, username, ... }@args: inputs.haumea.lib.load {
    src = ./vanessa;
    inputs = args // {
      inherit inputs;
    };
    transformer = inputs.haumea.lib.transformers.liftDefault;
  };
in
{
  vanessa = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./vanessa/_hardware.nix
      common/btrfs.nix
      common/encryption.nix
      module
      inputs.home-manager.nixosModules.home-manager
      inputs.grub2-themes.nixosModules.default
    ];
    specialArgs = { inherit inputs username home; };
  };
}
