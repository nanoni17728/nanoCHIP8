{
  description = "CHIP-8 runtime in modern C++";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.cmake
          pkgs.clang
        ];
        buildInputs = [
          pkgs.lldb
        ];
        shellHook = ''
          if command -v > /dev/null
            then fish && exit
          fi
        '';
      };
    });
}
