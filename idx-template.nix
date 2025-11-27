{ pkgs, ... }: {
  channel = "stable-25.05";
  packages = [ pkgs.php84 pkgs.php84.packages.composer pkgs.nodejs_latest ];
  bootstrap = ''
    composer create-project nunomaduro/laravel-starter-kit --prefer-dist "$out"
    mkdir "$out"/.idx
    cp ${./dev.nix} "$out"/.idx/dev.nix
    cd "$out"
    composer setup
    npm install playwright
    npx playwright install-deps
  '';
}
