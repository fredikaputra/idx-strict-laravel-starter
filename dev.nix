{ pkgs, ... }: {
  channel = "stable-25.05";
  packages = [
    pkgs.php84
    pkgs.php84.packages.composer
  ];
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
        sail-up = "sail up -d";
      };
    };
  };
}
