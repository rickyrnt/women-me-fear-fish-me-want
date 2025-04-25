{
  description = "The most important hotkey you could possibly have";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
    inputs.flake-utils.lib.eachDefaultSystem(system:
      let 
        pkgs = (import inputs.nixpkgs) { 
          inherit system;
          overlays = [
            (final: prev: {
              pythonPackagesOverlays = (prev.pythonPackagesOverlays or [ ]) ++ [
                (pyfinal: pyprev: {
                  my_pyttsx3 = pyfinal.callPackage ./pyttsx3.nix {};
                })
              ];
              
              python3 = let
                self = prev.python3.override {
                  inherit self;
                  packageOverrides = prev.lib.composeManyExtensions final.pythonPackagesOverlays;
                };
              in self;

              python3Packages = final.python3.pkgs;
            })
          ];
        };
      in 
      {
        packages = rec {
          women-me-fear-fish-me-want = pkgs.callPackage ./women-me-fear-fish-me-want.nix { inherit (inputs); };
          default = women-me-fear-fish-me-want;
        };

        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.alsa-utils
            pkgs.espeak-ng
            (pkgs.python3.withPackages ( py: [
              py.pyttsx3
              py.xdg
            ]))
          ];
          shellHook = "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${pkgs.espeak}/lib";
        };
      }
    );
}
