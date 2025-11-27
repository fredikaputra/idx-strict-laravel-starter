# IDX Strict Laravel Starter

A strict, standardized template for bootstrapping a new Laravel application. This repository combines the **ultra-strict, type-safe architecture** of the [nunomaduro/laravel-starter-kit](https://github.com/nunomaduro/laravel-starter-kit) with the streamlined development experience of **Firebase Studio**, leveraging **Nix** for a fully reproducible and dependency-free environment.

## 🚀 Getting Started

Since this repository is built to run seamlessly within Firebase Studio, the setup process is simplified.

### 1. Open in Firebase Studio

<a href="https://studio.firebase.google.com/new?template=https%3A%2F%2Fgithub.com%2Ffredikaputra%2Fidx-strict-laravel-starter">
  <picture>
    <source
      media="(prefers-color-scheme: dark)"
      srcset="https://cdn.firebasestudio.dev/btn/open_dark_32.svg">
    <source
      media="(prefers-color-scheme: light)"
      srcset="https://cdn.firebasestudio.dev/btn/open_light_32.svg">
    <img
      height="32"
      alt="Open in Firebase Studio"
      src="https://cdn.firebasestudio.dev/btn/open_blue_32.svg">
  </picture>
</a>

### 2. Complete Initial Setup

Once the workspace is loaded in Firebase Studio, you must run the following commands in the terminal to ensure file permissions are correct and the database is initialized:

```sh
# Enter the Sail environment shell
sail root-shell
```

```sh
# Fix file permissions for storage directory
chown -R sail storage

# Run migrations to set up the database
php artisan migrate
```
