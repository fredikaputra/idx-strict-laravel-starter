# IDX Strict Laravel Starter

A strict, standardized template for bootstrapping a new Laravel application. This repository combines the **ultra-strict, type-safe architecture** of the [nunomaduro/laravel-starter-kit](https://github.com/nunomaduro/laravel-starter-kit) with the streamlined development experience of **Firebase Studio**, leveraging **Nix** for a fully reproducible and dependency-free environment.

## 🚀 Getting Started

Simply click the button below to launch the template directly in Firebase Studio. The environment will load, and you can proceed with the Initial Setup steps.

<a href="https://studio.firebase.google.com/new?template=https%3A%2F%2Fgithub.com%2Ffredikaputra%2Fidx-laravel">
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

## ⚠️ Important Permissions Note

You **must always** interact with the Laravel environment and its files, particularly within the `storage` and other potentially permission-sensitive directories, by first entering the Docker container shell.

To gain the necessary **root permissions** for file modification and administration inside the container, you must use the following command:

```bash
sail root-shell
```
