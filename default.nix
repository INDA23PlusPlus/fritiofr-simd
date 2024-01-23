let
  pkgs = import <nixpkgs> { };
in
pkgs.stdenv.mkDerivation {
  name = "program";
  src = ./.;
  buildPhase = ''
    $CC main.c -o program
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp program  $out/bin/program
  '';
}
