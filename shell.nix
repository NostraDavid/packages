{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.cabal-install
    pkgs.ghc
    pkgs.stack
    pkgs.zlib
  ];

  shellHook = ''
    export LD_LIBRARY_PATH=${
      pkgs.lib.makeLibraryPath [
        pkgs.zlib
      ]
    }
  '';
}
