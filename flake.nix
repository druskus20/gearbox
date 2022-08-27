{
  inputs = {
    home-manager = {
      url = github:nix-community/home-manager/release-22.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = github:NixOS/nixpkgs/nixos-22.05;
  };

  outputs = { self, nixpkgs, ... }@args: {
    nixosConfigurations.drusk = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = args // { inherit nixpkgs; };
      modules = [ ./configuration.nix ];
    };
  };
}
