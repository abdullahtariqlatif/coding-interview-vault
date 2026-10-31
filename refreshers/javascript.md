# JavaScript refresher

## Fundamentals interviewers always ask about
- `var` / `let` / `const`, hoisting, the temporal dead zone
- **Closures**: counters, memoization, private state
- **`this`**: in plain function calls, method calls, arrow functions, and with `call` / `apply` / `bind`
- **Prototypes**: the prototype chain, `class` as syntax over prototypes, `Object.create`
- **The event loop**: call stack, microtasks (promises) vs macrotasks (`setTimeout`)
- **Promises and `async`/`await`**: error handling, `Promise.all` / `allSettled` / `race` / `any`
- `==` vs `===`, truthy and falsy values, `typeof null`
- Shallow vs deep copy: spread, `structuredClone`
- Modules: ESM `import` / `export` vs CommonJS `require`

## Modern syntax and APIs (ES2020+)

```js
user?.address?.city ?? "unknown"          // optional chaining + nullish coalescing
count ||= 0; config ??= {}; total &&= 1  // logical assignment
arr.at(-1)                                // last item

// Non-mutating array methods (ES2023)
arr.toSorted((a, b) => a - b); arr.toReversed(); arr.with(0, "x"); arr.toSpliced(1, 1)
arr.findLast(x => x > 2); arr.findLastIndex(x => x > 2)

// Grouping (ES2024)
Object.groupBy(users, u => u.role)        // { admin: [...], user: [...] }

const { promise, resolve, reject } = Promise.withResolvers(); // ES2024

// Set methods (ES2025)
a.union(b); a.intersection(b); a.difference(b); a.isSubsetOf(b)

// Iterator helpers (ES2025)
someIterator.map(x => x * 2).filter(Boolean).take(5).toArray()
```

## React (19)
- Hooks: `useState`, `useEffect` (and its cleanup), `useMemo`, `useCallback`, `useRef`, `useContext`, `useReducer`, custom hooks
- **React 19**: Actions, `useActionState`, `useOptimistic`, `useFormStatus`, `use()`, `ref` passed as a normal prop
- **React Compiler**: automatic memoization, so less manual `useMemo` / `useCallback`
- Keys in lists, controlled vs uncontrolled inputs, lifting state up, avoiding unnecessary re-renders
- Data fetching: loading and error states; TanStack Query in real apps
