{ nixpkgs ? import <nixpkgs> {} }:
let
  inherit (nixpkgs) pkgs;
  inherit (pkgs) haskellPackages;
  inherit (nixpkgs.haskell.lib) dontCheck doJailbreak;
  project = import ./release.nix;
in
pkgs.stdenv.mkDerivation {
  name = "shell";
  allowBroken = true;
  buildInputs = project.env.nativeBuildInputs ++ [
    (import (builtins.fetchTarball "https://github.com/cachix/ghcide-nix/tarball/master") {}).ghcide-ghc865
    haskellPackages.cabal-install
    haskellPackages.hlint
    haskellPackages.hindent
  ];
  shellHook = ''
export NIX_GHC="$(which ghc)"
export NIX_GHCPKG="$(which ghc-pkg)"
export NIX_GHC_DOCDIR="$NIX_GHC/../../share/doc/ghc/html"
export NIX_GHC_LIBDIR="$(ghc --print-libdir)"
'';
}
