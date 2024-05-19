{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.ghc
    pkgs.stack
    pkgs.cabal-install
    pkgs.zlib
    pkgs.zlib.dev
    pkgs.libpng
    pkgs.libjpeg
    pkgs.glibc
    pkgs.glibc.dev
  ];

  shellHook = ''
    export LD_LIBRARY_PATH=${
      pkgs.lib.makeLibraryPath [
        pkgs.zlib
        pkgs.zlib.dev
        pkgs.libpng
        pkgs.libjpeg
        pkgs.glibc
        pkgs.glibc.dev
      ]
    }
  '';
}
