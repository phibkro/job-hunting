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
        packages = [ pkgs.typst pkgs.just pkgs.chromium pkgs.python3 ] ++ fonts;
        TYPST_FONT_PATHS = pkgs.lib.makeSearchPath "share/fonts" fonts;
        # agent-browser's auto-downloaded Chrome is an FHS binary and can't
        # run on NixOS; point it at nix-built chromium instead
        AGENT_BROWSER_EXECUTABLE_PATH = "${pkgs.chromium}/bin/chromium";
      };
    };
}
