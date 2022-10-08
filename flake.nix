{
  description = "wasm-pack setup";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    rust-overlay = { url = "github:oxalica/rust-overlay"; };
  };

  outputs = { nixpkgs, rust-overlay, ... }:
    let system = "x86_64-linux";
    in
    {
      devShell.${system} =
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ rust-overlay.overlays.default ];
          };
          inherit (pkgs) stdenv lib;
          xorg = pkgs.xorg;
        in
        (({ pkgs, ... }:
          pkgs.mkShell {
            buildInputs = with pkgs; [
              pkg-config
              openssl.dev
              cargo
              cargo-watch
              nodejs
              wasm-pack
              (rust-bin.stable.latest.default.override {
                extensions = [ "rust-src" ];
                targets = [ "wasm32-unknown-unknown" ];
              })
            ];

            shellHook = "";

            PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
            LD_LIBRARY_PATH = with xorg; lib.makeLibraryPath [
              libX11
              libXcursor
              libXi
              libXrandr
              pkgs.vulkan-loader
            ];
          }) { pkgs = pkgs; });
    };
}
