{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-23.05;
    # impermanence.url = "github:nix-community/impermanence";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = github:nix-community/home-manager/release-23.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secrets
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
  	self, 
  	nixpkgs, 
  	#home-manager, 
	nixpkgs-unstable,
	agenix,
	nur, ... 
	}@args: {
    nixosConfigurations.drusk = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = args // { inherit nixpkgs; };
      modules = [ ./common.nix ./system.nix ];
    };
  };
}
