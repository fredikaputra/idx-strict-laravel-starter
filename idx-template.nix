{ pkgs, sail ? false }: {
  channel = "stable-25.05";
  packages = [ pkgs.php84 pkgs.php84.packages.composer pkgs.nodejs_latest pkgs.j2cli ];
  bootstrap = ''
    composer create-project nunomaduro/laravel-starter-kit --prefer-dist "$out"
    mkdir "$out"/.idx
    sail=${toString sail} j2 ${./devNix.j2} -o "$out/.idx/dev.nix"
    chmod -R u+w "$out"
    ${
      if sail then
        ''
          (
            cd "$out"

            npm install
            composer require laravel/sail
            php artisan sail:install --with mysql --devcontainer
            echo 'APP_PORT=8000' >> .env

            cat << SCRIPT > vendor/onCreate.sh
rm vendor/onCreate.sh
cat << 'EOF' >> ~/.bashrc
alias sail='sh \$([ -f sail ] && echo sail || echo vendor/bin/sail)'
EOF
./vendor/bin/sail up -d
sleep 20
echo "npx playwright install && php artisan about" | ./vendor/bin/sail root-shell
SCRIPT
            chmod u+x vendor/onCreate.sh
          )
        ''
      else
        ""
    }
  '';
}
