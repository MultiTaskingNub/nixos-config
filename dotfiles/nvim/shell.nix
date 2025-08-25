{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage (
  {
    mkShellNoCC,
    lua-language-server,
    stylua
  }:
  mkShellNoCC {
    name = "nvim";
    packages = [
      lua-language-server
      stylua
    ];
  }
) { }
