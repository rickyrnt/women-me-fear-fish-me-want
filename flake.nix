{
  description = "The most important hotkey you could possibly have";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: 
  let 
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = [
        pkgs.python3
        pkgs.python312Packages.pyttsx3
      ];
    };
  };
}
