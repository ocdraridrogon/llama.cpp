{
  description = "Wrapper flake for llama-cpp";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    llama-cpp = {
      url = "path:../";  # This points to your llama-cpp folder, one level up
    };
  };

  outputs = { self, nixpkgs, llama-cpp }:
    let
      pkgs = import nixpkgs {
        system = "aarch64-darwin"; # or your system, change if needed
      };
    in {
      packages = {
        llama-cpp-wrapper = llama-cpp.packages.default;
      };

      devShells = {
        default = pkgs.mkShell {
          buildInputs = [ llama-cpp.packages.default ];
        };
      };
    };
}

