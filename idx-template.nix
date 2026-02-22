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

      cat <<EOF > patch-vite.ts
      import { readFileSync, writeFileSync } from "fs";

      let content = readFileSync("vite.config.js", "utf-8");

      if (!content.includes("process.loadEnvFile();")) {
          content = content.replace("export default defineConfig({", "process.loadEnvFile();\\n\\nexport default defineConfig({");
      }

      const hmrBlock = "        hmr: {\\n" +
                      "            host: process.env.HMR_HOST,\\n" +
                      "            clientPort: parseInt(process.env.HMR_PORT || \'\'),\\n" +
                      "            protocol: process.env.HMR_PROTOCOL,\\n" +
                      "        },";

      const fullServerBlock = "    server: {\\n" + hmrBlock + "\\n    },";

      if (content.includes("server: {")) {
          content = content.replace("server: {", "server: {\\n" + hmrBlock);
      } else {
          content = content.replace(/\\}\\);\\s*$/, (match) => {
              return fullServerBlock + "\\n" + match;
          });
      }

      writeFileSync("vite.config.js", content);
      EOF

      bun patch-vite.ts
      rm patch-vite.ts
    '';
}
