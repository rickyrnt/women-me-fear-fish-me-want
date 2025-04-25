{ lib, python3packages, alsa-utils, espeak-ng }:
with python3packages; buildPythonApplications rec {
  pname = "women-me-fear-fish-me-want";
  version = "1.0.0";
  
  dependencies = [ pyttsx3 xdg ];
  
  src = ./.;
  
  installPhase = ''
    cp fishlines.txt $out
  '';

  meta = {
    description = "A highly important program which plays a random permutation of 'women want me fish fear me'";
    maintainers = lib.maintainers.rickyrnt;
  };
}