{ lib, python3Packages, espeak, alsa-utils }:
with python3Packages; buildPythonApplication rec {
  pname = "women-me-fear-fish-me-want";
  version = "1.0.0";
  
  dependencies = [ pyttsx3 xdg alsa-utils ];
  
  src = ./.;
  
  postInstall = ''
    cp fishlines.txt $out/bin
  '';

  # Ensure espeak is available at runtime
  preFixup = ''
    export LD_LIBRARY_PATH=${espeak}/lib:$LD_LIBRARY_PATH
  '';

  meta = {
    description = "A highly important program which plays a random permutation of 'women want me fish fear me'";
  };
}