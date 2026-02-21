{ pkgs, kit ? "blade-kit", ... }: {
    channel = "stable-25.05";
    packages = [
      pkgs.php84
      pkgs.php84Packages.composer
      pkgs.bun
      pkgs.j2cli
    ];

    bootstrap = ''
      composer create-project laravel/laravel "$out" --remove-vcs --prefer-dist --no-scripts
			mkdir "$out"/.idx
      j2 ${./devNix.j2} -o "$out/.idx/dev.nix"
      chmod -R u+w "$out"
    '';
}
