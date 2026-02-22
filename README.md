# IDX Laravel Starter: Multi-Flavor Edition

A standardized, Nix-powered template for bootstrapping Laravel applications in Firebase Studio. This repository goes beyond a basic install, offering a variety of starter kits—from standard Laravel setups to the ultra-strict, type-safe architecture championed by Nuno Maduro.

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

## 🛠️ How to Setup Vite Server

To ensure Hot Module Replacement (HMR) works correctly within the cloud environment, update your vite.config.js to utilize environment variables for the dev server connection:

```js
import { defineConfig } from 'vite';
// ... other imports

process.loadEnvFile(); // <--- ADD THIS

export default defineConfig({
    // ... other configurations
    server: {
        // ... other server configs
        hmr: {
            host: process.env.HMR_HOST,
            clientPort: parseInt(process.env.HMR_PORT || ""),
            protocol: process.env.HMR_PROTOCOL,
        },
    },
});
```

### Environment Configuration

1. Open the Backend Ports tab in Firebase Studio.
1. Locate port 5173 and change its visibility to Public.
1. Add the following variables to your .env file, copying the host from that same tab:

```env
# Get HMR_HOST from Firebase Studio "Backend Ports" tab (for port 5173)
HMR_HOST=your-unique-studio-id.cloudworkstations.dev
HMR_PORT=443
HMR_PROTOCOL=wss
```

> *Note*: When copying the host from the Backend Ports tab, ensure you omit the https:// prefix and any trailing slashes.