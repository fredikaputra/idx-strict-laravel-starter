{ pkgs, ... }: {
  packages = [ pkgs.php84 pkgs.php84.packages.composer ];
  bootstrap = ''
    composer create-project nunomaduro/laravel-starter-kit --prefer-dist "$out"
    ls -la
    echo '==='
    ls -la "$out"
  '';
}
