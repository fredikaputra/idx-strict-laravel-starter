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
          cd $out
          && composer require laravel/sail
          && php artisan sail:install --with mysql --devcontainer
          && echo \"alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'\" >> /home/user/.bashrc
        )"
      else
        ""
    }
  '';
}
