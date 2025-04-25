{ lib, python3Packages, alsa-utils, espeak-ng }:
with python3Packages; buildPythonApplication rec {
  pname = "women-me-fear-fish-me-want";
  version = "1.0.0";
  
  dependencies = [ pyttsx3 xdg ];
  
  src = ./.;
  
  postInstall = ''
    cp fishlines.txt $out/bin
  '';

  meta = {
    description = "A highly important program which plays a random permutation of 'women want me fish fear me'";
  };
}