{
  description = "tasky - task launcher";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: 
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config = { allowUnfree = "true";};
    };
  in {
    packages.x86_64-linux.tasky = pkgs.runCommandLocal "tasky" {
      script = ./tasky;
      nativeBuildInputs = [ pkgs.makeWrapper ];
    } ''
      makeWrapper $script $out/bin/tasky \
      --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.bash pkgs.inotify-tools pkgs.libnotify ]}
    '';

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.tasky;

    overlay = (final: prev: {
      tasky = self.packages.x86_64-linux.tasky;
    });

  };
}
