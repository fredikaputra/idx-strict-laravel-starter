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
        else "composer create-project laravel/laravel \"$out\" --remove-vcs --prefer-dist --no-scripts"
      }

      mkdir -p "$out"/.idx
      j2 ${./devNix.j2} -o "$out/.idx/dev.nix"
      
      cd "$out"

      echo "" >> .env.example
      echo "HMR_HOST=" >> .env.example
      echo "HMR_PORT=443" >> .env.example
      echo "HMR_PROTOCOL=wss" >> .env.example

      sed -i "/export default defineConfig({/i process.loadEnvFile();\n" vite.config.js
      sed -i "s/server: {/server: {\n        hmr: {\n            host: process.env.HMR_HOST,\n            clientPort: parseInt(process.env.HMR_PORT || \"\"),\n            protocol: process.env.HMR_PROTOCOL,\n        },/" vite.config.js
    '';
}
