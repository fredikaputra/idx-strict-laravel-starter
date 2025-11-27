{ pkgs, ... }: {
  channel = "stable-25.05";
  packages = [
    pkgs.php84
    pkgs.php84.packages.composer
  ];
  services.docker.enable = true;
  idx = {
    extensions = [
      "laravel.vscode-laravel"
      "bmewburn.vscode-intelephense-client"
    ];
    # previews = {
    #   enable = true;
    #   previews = {
    #     web = {
    #       command = ["php" "artisan" "serve" "--port" "$PORT" "--host" "0.0.0.0"];
    #       manager = "web";
    #     };
    #   };
    # };
    workspace = {
      onCreate = {
        sail = "echo 'APP_PORT=8000' >> .env && echo \"alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'\" >> ~/.bashrc && ./vendor/bin/sail build";
      };
      onStart = {
        sail = "sail up -d && sail root-shell";
      };
    };
  };
}
