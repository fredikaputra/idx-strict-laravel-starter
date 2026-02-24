# IDX Laravel

This is a simple, ready-to-go template for building Laravel apps inside Firebase Studio.

## ⚡ Supported Starter Kits

The environment automatically detects your choice and provisions the correct architecture using Nix. Choose your flavor:

| Stack | Type | Source Package |
| :--- | :--- | :--- |
| **Blade** | **Strict** | `nunomaduro/laravel-starter-kit` |
| **React** | **Strict** | `nunomaduro/laravel-starter-kit-inertia-react` |
| **Vue** | **Strict** | `nunomaduro/laravel-starter-kit-inertia-vue` |
| **Livewire** | Standard | `laravel/blank-livewire-starter-kit` |
| **React** | Standard | `laravel/blank-react-starter-kit` |
| **Vue** | Standard | `laravel/blank-vue-starter-kit` |
| **Svelte** | Standard | `laravel/blank-svelte-starter-kit` |
| **Laravel Core** | Default | `laravel/laravel` |

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

## 🛠️ Network Configuration (Crucial)
To ensure the environment functions correctly, you must adjust the port visibility in the **Backend Ports** tab:

1. **Vite Development Server**

- Port: `5173`
- Visibility: Change from Private to Public.
- Reason: Allows your browser to load hot-reloaded assets and CSS.

2. **Laravel Development Server**

- Port: `9000`
- Visibility: Change from Private to Public.
- Reason: The headless browser runner requires a public tunnel to access the application. If this is set to private, tests will fail.