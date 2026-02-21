{ pkgs, kit ? "blade-kit", ... }: {
    channel = "stable-25.05";
    packages = [
      pkgs.php84
      pkgs.php84Packages.composer
      pkgs.bun
      pkgs.j2cli
    ];

    bootstrap = ''
      ${
        if kit == "livewire" then "composer create-project laravel/blank-livewire-starter-kit \"$out\" --stability=dev"
        else if kit == "blade-strict" then "composer create-project nunomaduro/laravel-starter-kit --prefer-dist \"$out\""
        else if kit == "react" then "composer create-project laravel/blank-react-starter-kit \"$out\" --stability=dev"
        else if kit == "react-strict" then "composer create-project nunomaduro/laravel-starter-kit-inertia-react --prefer-dist \"$out\""
        else if kit == "vue" then "composer create-project laravel/blank-vue-starter-kit \"$out\" --stability=dev"
        else if kit == "vue-strict" then "composer create-project nunomaduro/laravel-starter-kit-inertia-vue --prefer-dist \"$out\""
        else if kit == "svelte" then "composer create-project laravel/blank-svelte-starter-kit \"$out\" --stability=dev"
        else ''
          (
            composer create-project laravel/laravel "$out" --remove-vcs --prefer-dist --no-scripts
            cp .env.example .env
            touch database/database.sqlite
            php artisan key:generate
            php artisan migrate:fresh --seed
          )
        ''
      }

      mkdir -p "$out"/.idx
      j2 ${./devNix.j2} -o "$out/.idx/dev.nix"
      chmod -R u+w "$out"
    '';
}
