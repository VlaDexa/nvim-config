{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "vladexa-nvim-config";
  src = ./.;

  installPhase = ''
    mkdir -p $out
    cp -r $src/* $out
  '';
}

# vim: ts=2 sw=2 et
