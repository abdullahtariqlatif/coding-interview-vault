# React

Two parts:

| Folder | Purpose |
|---|---|
| `topics/` _(not created yet)_ | One Vite app with a small, runnable example for each React topic, from basics to advanced, to learn or revise |
| `api_frontend/` _(not created yet)_ | The React frontend for the Rails API app in [`../rails`](../rails/) |

The full topic checklist is in [roadmap/react.md](../roadmap/react.md).

## Creating the apps

```bash
cd react
npm create vite@latest topics -- --template react        # or react-ts
npm create vite@latest api_frontend -- --template react
cd topics && npm install && npm run dev
```

Vite doesn't create a nested git repo, so the apps are tracked here as normal.

## 1. Topics app

Keep each topic in its own folder with a short `README.md` of notes and one or more example components. Link them from a simple menu (or React Router) in `App.jsx`:

```
topics/src/
├── App.jsx                     # menu linking every topic
└── topics/
    ├── 01-jsx/
    ├── 02-components-and-props/
    ├── 03-state/
    ├── 04-events-and-forms/
    ├── 05-lists-and-keys/
    ├── 06-effects/
    ├── 07-refs/
    ├── 08-context/
    ├── 09-reducer/
    ├── 10-custom-hooks/
    ├── 11-memoization/
    ├── 12-routing/
    ├── 13-data-fetching/
    ├── 14-error-boundaries-suspense-portals/
    ├── 15-react-19-features/
    └── 16-class-components-legacy/
```

### Topic checklist
- [ ] **JSX**: expressions, fragments, conditional rendering (and the `0 &&` bug), `className`, `style`
- [ ] **Components and props**: destructuring, defaults, `children`, composition, passing callbacks
- [ ] **State**: `useState`, functional updates, batching, updating objects and arrays immutably, lifting state up
- [ ] **Events and forms**: controlled vs uncontrolled inputs, one handler for many inputs, `preventDefault`, validation
- [ ] **Lists and keys**: why indexes are bad keys, resetting state with a key
- [ ] **Effects**: dependencies, cleanup, fetching with `AbortController`, "you might not need an effect"
- [ ] **Refs**: focusing an input, keeping values between renders without re-rendering
- [ ] **Context**: a theme or auth context, avoiding unnecessary re-renders
- [ ] **`useReducer`**: a todo list or cart with actions
- [ ] **Custom hooks**: `useFetch`, `useDebounce`, `useLocalStorage`
- [ ] **Memoization**: `React.memo`, `useMemo`, `useCallback`, showing a re-render before and after
- [ ] **Routing**: React Router, nested routes, URL params, protected routes
- [ ] **Data fetching**: loading, error and empty states; TanStack Query
- [ ] **Error boundaries, Suspense, `React.lazy`, portals** (a modal)
- [ ] **React 19**: `useActionState`, `useOptimistic`, `useFormStatus`, `use()`, `ref` as a prop
- [ ] **Class components (legacy)**: lifecycle methods side by side with their hook equivalents
- [ ] **Testing**: React Testing Library for a form and a list

## 2. API frontend

A React app that uses the Rails API app.

- [ ] An API client module (base URL from `import.meta.env.VITE_API_URL`, auth header, JSON error handling)
- [ ] Login and logout with a token; protected routes
- [ ] List, detail, create, edit and delete pages for the main resource
- [ ] Showing Rails validation errors (422) next to form fields
- [ ] Loading, error and empty states; pagination; search with debounce
- [ ] Optimistic updates (`useOptimistic` or TanStack Query)

### Connecting to the Rails API
1. In the Rails app, add the `rack-cors` gem and allow `http://localhost:5173` in `config/initializers/cors.rb`.
2. Run Rails on port 3000 and Vite on 5173.
3. Use `fetch("http://localhost:3000/...")`, or set up a Vite proxy in `vite.config.js`:
   ```js
   server: { proxy: { "/api": "http://localhost:3000" } }
   ```

### Other ways to combine React with Rails (good to know for interviews)
- **jsbundling-rails** (`rails new app -j esbuild`): React lives inside the Rails app and is served by Rails.
- **vite_ruby** (`vite_rails` gem): Vite integrated into Rails.
- **Inertia.js**: Rails controllers render React pages without building a separate API.
- **Separate app + API** (used here): the simplest to explain and the most common in real teams.
