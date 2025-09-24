# flake.nix
{
    description = "A flake for developing with node22";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    #       ↑ Swap it for your system if needed
    #       "aarch64-linux" / "x86_64-darwin" / "aarch64-darwin"
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {

      packages = [ 
          pkgs.nodejs_22
          pkgs.watchexec
          pkgs.playwright-driver.browsers
       ];
      # ...
      env = {
        NIX_LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath [
          pkgs.stdenv.cc.cc
        ];
        NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";        
      };

      shellHook = ''
        echo "***************************************************"
        echo "*** Welcome to node"
        echo "***************************************************"
        echo ""
        echo node:$(node --version)
        echo $(watchexec --version)
        export PLAYWRIGHT_BROWSERS_PATH=${pkgs.playwright-driver.browsers}
        export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=true
      '';

    };
  };
}
