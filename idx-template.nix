{ pkgs, sail ? false }: {
  channel = "stable-25.05";
  packages = [ pkgs.php84 pkgs.php84.packages.composer pkgs.nodejs_latest ];
  bootstrap = ''
    composer create-project nunomaduro/laravel-starter-kit --prefer-dist "$out"
    mkdir "$out"/.idx
    cp ${./dev.nix} "$out"/.idx/dev.nix
    chmod -R u+w "$out"
    ${
      if sail then
        "(
          cd $out && composer require laravel/sail && php artisan sail:install --with mysql --devcontainer && echo 'docker exec -it laravel-starter-kit-laravel.test-1 bash -c \"chown -R sail storage && php artisan migrate\"' > vendor/setup.sh && chmod u+x vendor/setup.sh
        )"
      else
        ""
    }
  '';
}
