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

## 🛠️ How to Setup Vite Server

To get Hot Module Replacement (HMR) working in the cloud, you just need to link your environment to the public port.

### Make the Port Public

1. Open the Backend Ports tab in Firebase Studio.
1. Find port 5173 (Vite).
1. Change its visibility from Private to Public.

### Update your .env

Copy the Host address from that same tab (it looks like a long URL) and add these lines to your .env file:

```env
# Get HMR_HOST from Firebase Studio "Backend Ports" tab (for port 5173)
HMR_HOST=your-unique-studio-id.cloudworkstations.dev
HMR_PORT=443
HMR_PROTOCOL=wss
```

> *Note*: When copying the host from the Backend Ports tab, ensure you omit the https:// prefix and any trailing slashes.

### Restart the Preview

Once your .env is saved, you must restart the dev server to apply the changes:

1. Open the Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P`).
1. Search for and select: `FirebaseStudio: Hard Restart Previews`.