# React checklist

Everything React that comes up in interviews, **from the early concepts people forget to React 19**. Items marked **(mid)** usually separate mid-level answers from junior ones.

← Back to [ROADMAP](../ROADMAP.md) · JavaScript first: [roadmap/javascript.md](javascript.md)

---

## 1. Core concepts
- [ ] What React is: a UI **library** (not a framework), declarative, component based, one-way data flow
- [ ] The **virtual DOM**, **reconciliation** and the diffing algorithm; why it's faster than manual DOM updates (and when it isn't)
- [ ] The render phase vs the commit phase
- [ ] React vs other approaches: Angular, Vue, Hotwire, server-rendered pages
- [ ] Single-page applications vs multi-page apps; client-side vs server-side rendering vs static generation **(mid)**
- [ ] Setting up a project: Vite (Create React App is deprecated), Next.js, `createRoot`, the entry point, `StrictMode`

## 2. JSX
- [ ] What JSX compiles to (`React.createElement` / the `jsx()` runtime)
- [ ] Embedding expressions with `{}`; JSX is an expression itself
- [ ] Attribute differences: `className`, `htmlFor`, camelCase events, `style={{ }}` objects, self-closing tags
- [ ] Returning one root element; **fragments** (`<>…</>`, `<Fragment key>`)
- [ ] **Conditional rendering**: `&&` (and the **`0 &&` rendering "0" bug**), ternaries, early return, `null`
- [ ] **Rendering lists** with `map` and **keys**: why keys matter, why array indexes are bad keys, using a key to reset state
- [ ] Comments in JSX; `dangerouslySetInnerHTML` (the XSS risk)

## 3. Components and props
- [ ] Function components, naming components with a capital letter, one component per file
- [ ] **Props**: passing and destructuring them, default values, **props are read-only**
- [ ] `children` and composition (wrapper or layout components, slots)
- [ ] Passing functions as props (child-to-parent communication)
- [ ] **Prop drilling**, and the ways around it (composition, Context, state libraries)
- [ ] Type checking props: PropTypes (legacy) vs TypeScript
- [ ] Patterns: container vs presentational, higher-order components, render props, compound components **(mid)**
- [ ] **Class components** (legacy, but still asked about): `render`, `this.state`, `setState` (merging, async), lifecycle methods (`componentDidMount`, `componentDidUpdate`, `componentWillUnmount`, `shouldComponentUpdate`), `PureComponent`, binding `this`
- [ ] Mapping lifecycle methods to hooks (mount, update and unmount → `useEffect`)

## 4. State
- [ ] `useState`: initial value, **lazy initialization** (`useState(() => expensive())`)
- [ ] **Functional updates** (`setCount(c => c + 1)`), and why `setCount(count + 1)` twice only adds one
- [ ] **State updates are asynchronous and batched** (automatic batching in React 18)
- [ ] **Updating objects and arrays without mutating them** (spread, `map`, `filter`, `toSorted`); Immer
- [ ] **State vs props**
- [ ] **Lifting state up**, a single source of truth, keeping state close to where it's used
- [ ] Derived state: don't store what you can calculate during render
- [ ] **Controlled vs uncontrolled components**
- [ ] `useReducer`: reducers, actions, dispatch; when to use it instead of `useState`

## 5. Rendering behaviour
- [ ] **What triggers a re-render**: a state change, the parent re-rendering, a context change (not prop changes on their own)
- [ ] Why components re-render even when props haven't changed, and `React.memo`
- [ ] Referential equality: inline objects and functions as props break memoization
- [ ] `StrictMode` double-invoking renders and effects in development (and why)
- [ ] Pure rendering: no side effects during render
- [ ] Resetting a component's state by changing its `key`

## 6. Effects
- [ ] **`useEffect`**: when it runs (after paint), the dependency array (none, `[]`, `[a, b]`), **cleanup functions** and when they run
- [ ] Common mistakes: missing dependencies, infinite loops, objects or functions as dependencies, stale closures
- [ ] **Data fetching in an effect**: loading and error state, race conditions, cancelling with `AbortController` or an ignore flag
- [ ] **"You might not need an effect"**: computing during render, handling things in event handlers, keys for resetting
- [ ] Subscriptions, timers and event listeners with cleanup
- [ ] `useLayoutEffect` vs `useEffect` **(mid)**
- [ ] The `eslint-plugin-react-hooks` exhaustive-deps rule

## 7. Other hooks
- [ ] **`useRef`**: DOM refs (focus, measuring, scrolling) and mutable values that persist without re-rendering
- [ ] **`useContext`**
- [ ] **`useMemo`** (cache a value) vs **`useCallback`** (cache a function), and when they're worth it
- [ ] `useId`, `useTransition`, `useDeferredValue` **(mid)**
- [ ] `useImperativeHandle`, `forwardRef` (no longer needed in React 19: `ref` is a normal prop) **(mid)**
- [ ] `useSyncExternalStore` **(mid)**
- [ ] **The rules of hooks** (only at the top level, only in components or custom hooks) and **why** (React relies on the call order)
- [ ] **Custom hooks**: `useFetch`, `useDebounce`, `useLocalStorage`, `useToggle`, `usePrevious`, `useOnClickOutside`

## 8. Events and forms
- [ ] Synthetic events, naming (`onClick`, `onChange`, `onSubmit`)
- [ ] **`onClick={handle}` vs `onClick={handle()}`**; passing arguments with an arrow function
- [ ] `e.preventDefault()` on form submit, `e.stopPropagation()`
- [ ] Controlled inputs: text, textarea, select, checkbox, radio; several inputs with one handler (`[e.target.name]`)
- [ ] Form validation and showing server-side (Rails 422) errors
- [ ] Form libraries: React Hook Form, Formik; schema validation with Zod or Yup
- [ ] File inputs and uploads (`FormData`)

## 9. Context and state management
- [ ] Context API: `createContext`, the Provider, `useContext`; what to use it for (theme, auth, locale)
- [ ] Context performance problems (every consumer re-renders), splitting contexts **(mid)**
- [ ] **Server state vs client state**
- [ ] TanStack Query (React Query): queries, mutations, caching, invalidation, loading and error states
- [ ] Redux: store, actions, reducers, `dispatch`, selectors, middleware (thunk); **Redux Toolkit** (`configureStore`, `createSlice`, `createAsyncThunk`, RTK Query)
- [ ] Zustand and Jotai (know that they exist and why people pick them)
- [ ] When you need a state library at all

## 10. Routing
- [ ] React Router: `createBrowserRouter` / `BrowserRouter`, `Routes` / `Route`, `Link` vs `NavLink` vs `<a>`
- [ ] `useNavigate`, `useParams`, `useSearchParams`, `useLocation`
- [ ] Nested routes and `<Outlet>`, index routes, a 404 route
- [ ] **Protected routes** (redirecting when not logged in)
- [ ] Loaders and actions (data routers) **(mid)**

## 11. Styling
- [ ] Plain CSS imports, CSS Modules, inline styles, Tailwind, CSS-in-JS (styled-components, Emotion)
- [ ] Conditional classes (`clsx`)
- [ ] Component libraries: MUI, Chakra, shadcn/ui, Ant Design

## 12. Performance **(mid)**
- [ ] `React.memo`, `useMemo`, `useCallback`, and the cost of overusing them
- [ ] **Code splitting**: `React.lazy` + `Suspense`, splitting by route
- [ ] Virtualizing long lists (react-window, TanStack Virtual)
- [ ] Avoiding unnecessary state and moving state down the tree
- [ ] Debouncing inputs, transitions for slow updates
- [ ] The React DevTools Profiler
- [ ] The **React Compiler** (automatic memoization)

## 13. Advanced features **(mid)**
- [ ] **Error boundaries** (still class components, or `react-error-boundary`)
- [ ] **Suspense** for code and data
- [ ] **Portals** (`createPortal`) for modals and tooltips
- [ ] React 18: concurrent rendering, `createRoot`, automatic batching, transitions, streaming SSR
- [ ] **React 19**: Actions, `useActionState`, `useFormStatus`, `useOptimistic`, `use()`, `ref` as a prop, `<title>` / `<meta>` in components, the React Compiler
- [ ] Server Components and Server Actions (mostly through Next.js), and how they differ from SSR

## 14. Working with APIs (React + Rails)
- [ ] Fetching with `fetch` or axios; base URLs, interceptors, error handling
- [ ] Loading, error and empty states; optimistic updates
- [ ] Authentication: storing tokens (cookies vs localStorage, and the security trade-off), sending `Authorization` headers, refreshing tokens, logging out
- [ ] CORS with a Rails API (`rack-cors`), the Vite dev proxy
- [ ] CSRF tokens when React is served by Rails on the same origin
- [ ] Pagination, infinite scroll, search with debounce
- [ ] Ways to combine React and Rails: a separate SPA + API, `jsbundling-rails`, `vite_rails`, the `react-rails` gem, Inertia.js

## 15. Testing
- [ ] Vitest / Jest basics: `describe`, `it` / `test`, `expect`, mocks
- [ ] **React Testing Library**: `render`, `screen`, `getBy` vs `queryBy` vs `findBy`, `userEvent`, testing behaviour rather than implementation details
- [ ] Mocking API calls (MSW), testing hooks, `act` warnings
- [ ] End-to-end testing: Playwright, Cypress **(mid)**

## 16. Accessibility and HTML basics
- [ ] Semantic HTML (`button` vs a clickable `div`), labels for inputs, `alt` text, heading order
- [ ] Keyboard navigation and focus management (modals), ARIA attributes (and when not to use them)

## 17. Tooling and ecosystem
- [ ] Vite config, environment variables (`VITE_` prefix), production builds, deploying static builds (Netlify, Vercel, S3)
- [ ] ESLint with the React hooks plugin, Prettier, TypeScript with React
- [ ] Next.js basics: the app router, file-based routing, SSR / SSG / ISR, server vs client components (often asked in MERN or Next roles)
