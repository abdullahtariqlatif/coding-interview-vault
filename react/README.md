# React

React frontend practice, mostly built as a separate frontend that calls a Rails API in [`../rails`](../rails/).

## Creating a new app

```bash
cd react
npm create vite@latest <app_name> -- --template react   # or react-ts
cd <app_name> && npm install && npm run dev
```

Vite doesn't create a nested git repo, so the app is tracked here as normal.

## Connecting to the Rails API

1. In the Rails app, add the `rack-cors` gem and allow `http://localhost:5173` in `config/initializers/cors.rb`.
2. Run Rails on port 3000 and Vite on 5173.
3. Use `fetch("http://localhost:3000/...")`, or set up a Vite proxy in `vite.config.js`:
   ```js
   server: { proxy: { "/api": "http://localhost:3000" } }
   ```

## Other ways to combine React with Rails

- **jsbundling-rails** (`rails new app -j esbuild`): React lives inside the Rails app and is served by Rails.
- **vite_ruby** (`vite_rails` gem): Vite integrated into Rails.
- **Separate app + API** (used here): the simplest to explain and the most common in real teams.

## Projects

| App | Description |
|---|---|
| _(none yet)_ | |
