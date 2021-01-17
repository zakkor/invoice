{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = [ pkgs.texlive.combined.scheme-full pkgs.gnum4 pkgs.gnumake pkgs.bc ];
}