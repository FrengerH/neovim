{
  description = "Neovim config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs }:    
  let
    overlay = import ./overlay/neovim;

    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ] (system:
        function (import nixpkgs {
          inherit system;
          overlays = [
            overlay
          ];
        }));

  in
  {
    overlays.default = overlay;

    packages = forAllSystems
    (pkgs: {
      default = pkgs.neovim;
    });

    nixosModules = rec {
      neovim = import ./module/neovim;
      default = neovim;
    };

  };

}
