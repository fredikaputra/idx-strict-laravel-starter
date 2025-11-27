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
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["composer" "run" "dev"];
          manager = "web";
          env = {
            PORT = "$PORT";
          };
        };
      };
    };
  };
}
