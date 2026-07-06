{
  description = "Job-hunting toolkit: typst CV/cover-letter builds";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # fonts referenced by src/*.typ (Carlito primary, Liberation fallback)
      fonts = [ pkgs.carlito pkgs.liberation_ttf ];
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.typst pkgs.just ] ++ fonts;
        TYPST_FONT_PATHS = pkgs.lib.makeSearchPath "share/fonts" fonts;
      };
    };
}
