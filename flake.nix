{
  description = "the schizo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations.iceblink = nixpkgs.lib.nixosSystem 
      {
        specialArgs = { inherit inputs; };
        modules = 
        [
          ./configuration.nix
	  ./fonts.nix
	  inputs.home-manager.nixosModules.default
        ];

      };

    };
}
