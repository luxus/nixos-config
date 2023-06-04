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
  cm-radius = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./cm-radius/_hardware.nix
      module
    ];
    specialArgs = { inherit inputs username home; };
  };
  vanessa = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./vanessa/_hardware.nix
      common/btrfs.nix
      common/encryption.nix
      module
      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-gpu-nvidia
      inputs.hardware.nixosModules.common-pc-ssd
      inputs.home-manager.nixosModules.home-manager
      inputs.grub2-themes.nixosModules.default
    ];
    specialArgs = { inherit inputs username home; };
  };
}
