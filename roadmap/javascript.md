# JavaScript checklist

Everything JavaScript that comes up in interviews, **from the fundamentals people forget to the modern features**. Items marked **(mid)** usually separate mid-level answers from junior ones.

← Back to [ROADMAP](../ROADMAP.md) · Notes: [refreshers/javascript.md](../refreshers/javascript.md) · React: [roadmap/react.md](react.md)

---

## 1. Basics
- [ ] What JS is: single-threaded, dynamically and weakly typed, JIT compiled; engines (V8); browser vs Node.js
- [ ] Where JS runs: `<script>`, `defer` vs `async`, modules (`type="module"`), the console, Node
- [ ] Strict mode (`"use strict"`), and why modules and classes are always strict
- [ ] Semicolons and automatic semicolon insertion (the classic `return` followed by a newline bug)
- [ ] Comments, naming conventions (`camelCase`, `PascalCase` for classes and components, `UPPER_CASE` constants)

## 2. Variables and scope
- [ ] `var` vs `let` vs `const`: scope, hoisting, redeclaring, reassigning
- [ ] **Hoisting**: function declarations (fully hoisted) vs `var` (hoisted as `undefined`) vs `let` / `const` (temporal dead zone)
- [ ] Scope types: global, function, block, module, lexical scope, the scope chain, shadowing
- [ ] The global object (`window`, `globalThis`); why `var` at the top level becomes a property of it
- [ ] `const` objects can still be mutated; `Object.freeze` (shallow)

## 3. Types and coercion
- [ ] The 7 primitives (`string`, `number`, `bigint`, `boolean`, `undefined`, `null`, `symbol`) plus `object`
- [ ] Primitives are copied by value; objects are shared by reference
- [ ] `typeof` quirks: `typeof null === "object"`, `typeof function === "function"`, `typeof NaN === "number"`, `typeof []`
- [ ] Checking types: `Array.isArray`, `instanceof`, `Number.isNaN` vs `isNaN`, `Number.isInteger`
- [ ] `null` vs `undefined`
- [ ] **Falsy values**: `false`, `0`, `-0`, `0n`, `""`, `null`, `undefined`, `NaN`; everything else is truthy (including `[]`, `{}` and `"0"`)
- [ ] **`==` vs `===`**, and the coercion rules behind `==`; `Object.is`
- [ ] Explicit conversion: `String()`, `Number()`, `parseInt(str, 10)`, `parseFloat`, `Boolean()` / `!!`, unary `+`
- [ ] Implicit coercion puzzles: `"5" + 1`, `"5" - 1`, `[] + []`, `[] + {}`, `true + 1`, `null + 1`, `undefined + 1`
- [ ] Number precision (`0.1 + 0.2`), `toFixed`, `Number.EPSILON`, `MAX_SAFE_INTEGER`, `BigInt`, `NaN !== NaN`, `Infinity`

## 4. Operators and syntax
- [ ] Arithmetic, `%`, `**`, pre vs post increment, compound assignment
- [ ] Logical operators return one of their operands: `a || b`, `a && b`; short-circuiting
- [ ] **`??` vs `||`** (only `null` / `undefined` vs any falsy value); `??=`, `||=`, `&&=`
- [ ] Optional chaining `?.`, `?.()`, `?.[]`
- [ ] The ternary operator, the comma operator, `typeof`, `instanceof`, `in`, `delete`, `void`
- [ ] **Destructuring**: arrays and objects, defaults, renaming, nested, in function parameters, swapping (`[a, b] = [b, a]`)
- [ ] **Spread vs rest** (`...`) in arrays, objects and function parameters
- [ ] Template literals, multi-line strings, tagged templates **(mid)**
- [ ] Labels, `switch` (and fall-through), `for`, `while`, `do...while`, `break` / `continue`
- [ ] **`for...in` (keys, including inherited ones) vs `for...of` (values of iterables)** vs `forEach` (can't `break` out of it)

## 5. Strings
- [ ] `length`, indexing, `at`, `charAt`, `slice` vs `substring` (vs the deprecated `substr`), `split`, `join`
- [ ] `includes`, `indexOf`, `startsWith`, `endsWith`, `search`, `match`, `matchAll`
- [ ] `replace` vs `replaceAll`, regex with the `g` flag, replacing with a function
- [ ] `trim` / `trimStart` / `trimEnd`, `padStart` / `padEnd`, `repeat`, `toUpperCase` / `toLowerCase`, `localeCompare`
- [ ] Strings are immutable
- [ ] Regex basics: literal vs `RegExp`, flags (`g`, `i`, `m`, `s`, `u`), `test`, `exec`, groups, named groups

## 6. Functions
- [ ] Declarations vs expressions vs **arrow functions** (no own `this`, `arguments` or `prototype`; can't be called with `new`)
- [ ] Default parameters, rest parameters, the `arguments` object
- [ ] Functions are first-class; higher-order functions; callbacks
- [ ] IIFEs, and why they were used (scope before modules existed)
- [ ] **Closures**: what they are, practical uses (private state, factories, memoization), the classic `var` in a loop with `setTimeout` bug
- [ ] Pure functions, side effects, immutability
- [ ] Recursion, and the call stack limit
- [ ] Currying, partial application, composition **(mid)**
- [ ] Function properties: `name`, `length`

## 7. `this`
- [ ] The rules: default binding (undefined in strict mode), implicit (`obj.method()`), explicit (`call`, `apply`, `bind`), `new`, and arrow functions (lexical `this`)
- [ ] Losing `this` when a method is passed as a callback, and the fixes (`bind`, an arrow function)
- [ ] **`call` vs `apply` vs `bind`**, and writing your own `bind`
- [ ] `this` in classes, event handlers and `setTimeout`

## 8. Objects
- [ ] Literals, dot vs bracket access, computed keys, shorthand properties and methods
- [ ] Getters and setters, property descriptors, `Object.defineProperty` **(mid)**
- [ ] `Object.keys` / `values` / `entries` / `fromEntries`, `Object.assign`, `Object.freeze` vs `seal` vs `preventExtensions`
- [ ] Checking properties: `in` vs `hasOwnProperty` vs `Object.hasOwn`
- [ ] **Shallow vs deep copy**: spread, `Object.assign`, `structuredClone`, `JSON.parse(JSON.stringify())` and its limits (dates, `undefined`, functions, cycles)
- [ ] Comparing objects by reference vs deep equality
- [ ] JSON: `stringify` (replacer, indentation, `toJSON`), `parse` (reviver)
- [ ] `Symbol`, well-known symbols (`Symbol.iterator`) **(mid)**

## 9. Arrays
- [ ] Creating: literal, `Array.from` (including from `{ length: n }`), `Array.of`, `new Array(3)` (holes), `fill`
- [ ] **Mutating**: `push`, `pop`, `shift`, `unshift`, `splice`, `sort`, `reverse`, `fill`, `copyWithin`
- [ ] **Non-mutating**: `slice`, `concat`, `map`, `filter`, `reduce`, `flat`, `flatMap`, `join`, `toSorted`, `toReversed`, `toSpliced`, `with`
- [ ] **`slice` vs `splice`**
- [ ] Searching: `indexOf`, `lastIndexOf`, `includes` (finds `NaN`), `find`, `findIndex`, `findLast`, `findLastIndex`, `some`, `every`
- [ ] `forEach` vs `map`; `reduce` with an initial value (and the bug without one)
- [ ] **`sort()` compares as strings by default**: `[10, 9, 1].sort()` → `[1, 10, 9]`; use `(a, b) => a - b`
- [ ] Removing duplicates (`[...new Set(arr)]`), grouping (`Object.groupBy`), chunking, flattening
- [ ] `length` tricks, array-like objects (`arguments`, NodeList), `Array.prototype.slice.call`

## 10. Map, Set, WeakMap, WeakSet
- [ ] `Map` vs plain objects (any key type, insertion order, `size`, performance for frequent adds and deletes)
- [ ] `Set` and the new set methods (`union`, `intersection`, `difference`)
- [ ] `WeakMap` and `WeakSet`: weak references, use cases (private data, caches) **(mid)**

## 11. Prototypes and classes
- [ ] **The prototype chain**; `__proto__` vs `prototype` vs `Object.getPrototypeOf`
- [ ] Constructor functions and the 4 steps of `new`
- [ ] `Object.create`, prototypal inheritance
- [ ] `class` syntax as a layer over prototypes: `constructor`, methods, `extends`, `super`, `static`, getters and setters
- [ ] Private fields and methods (`#x`), static blocks, class fields
- [ ] `instanceof`, and how it works
- [ ] Composition vs inheritance; mixins

## 12. Asynchronous JavaScript
- [ ] **The event loop**: call stack, Web APIs, the macrotask queue, the **microtask queue** (promises, `queueMicrotask`), rendering
- [ ] Output-order questions mixing `setTimeout`, `Promise.then` and `console.log`
- [ ] `setTimeout` / `setInterval` / `clearTimeout`; `setTimeout(fn, 0)`; nested timers
- [ ] Callbacks and callback hell
- [ ] **Promises**: the states (pending, fulfilled, rejected), `then` / `catch` / `finally`, chaining and returning values, error propagation
- [ ] `Promise.all` vs `allSettled` vs `race` vs `any`; `Promise.resolve` / `reject`; `Promise.withResolvers`
- [ ] **`async` / `await`**: an async function always returns a promise, `try/catch`, sequential vs parallel awaits, `await` in loops, top-level `await`
- [ ] Unhandled rejections
- [ ] **`fetch`**: `response.ok` (fetch **doesn't reject on 4xx or 5xx**), `.json()`, headers, method, body, credentials, `AbortController` for cancelling and timeouts
- [ ] `requestAnimationFrame` **(mid)**
- [ ] Writing your own `Promise.all`, a promisified `setTimeout`, and retry with backoff **(mid)**

## 13. Iterators and generators **(mid)**
- [ ] The iteration protocol (`Symbol.iterator`, `next()`), making an object iterable
- [ ] Generators: `function*`, `yield`, `yield*`; async generators and `for await...of`

## 14. Modules and tooling
- [ ] ES modules: named vs default exports, `import * as`, re-exports, dynamic `import()`
- [ ] ES modules vs CommonJS (`require`, `module.exports`)
- [ ] npm, yarn, pnpm; `package.json` (`dependencies` vs `devDependencies`, `scripts`), lock files, semver (`^` vs `~`)
- [ ] Bundlers and build tools: Vite, esbuild, webpack; what transpiling (Babel) and tree shaking do
- [ ] ESLint, Prettier
- [ ] Environment variables in front-end builds (`import.meta.env`) and why they aren't secret

## 15. The DOM and the browser
- [ ] Selecting elements: `getElementById`, `querySelector` / `querySelectorAll`; NodeList vs HTMLCollection
- [ ] Creating, inserting and removing elements; `append`, `prepend`, `remove`, `insertAdjacentHTML`
- [ ] **`textContent` vs `innerText` vs `innerHTML`** (and the XSS risk)
- [ ] Attributes vs properties, `classList`, `dataset` (`data-*`), `style`
- [ ] Events: `addEventListener` (and its options: `once`, `passive`, `capture`), the event object, `target` vs `currentTarget`
- [ ] **Event bubbling vs capturing**, `stopPropagation`, `preventDefault`
- [ ] **Event delegation**
- [ ] Forms: `submit` events, `FormData`, input events, validation
- [ ] `DOMContentLoaded` vs `load`; script `defer` vs `async`
- [ ] Storage: `localStorage` vs `sessionStorage` vs cookies; IndexedDB (just know what it is)
- [ ] BOM: `window.location`, the `history` API, `navigator`
- [ ] Reflow and repaint, why batching DOM changes matters **(mid)**
- [ ] Observers: `IntersectionObserver` (lazy loading, infinite scroll), `MutationObserver`, `ResizeObserver` **(mid)**

## 16. Errors and debugging
- [ ] `try` / `catch` / `finally`, `throw`, built-in error types (`TypeError`, `ReferenceError`, `SyntaxError`, `RangeError`)
- [ ] Custom error classes
- [ ] Debugging with DevTools: breakpoints, the `debugger` statement, the network tab, `console.table`, `console.time`

## 17. Common patterns and utilities to write from scratch
- [ ] **Debounce** and **throttle** (and when to use each)
- [ ] Memoize, `once`, curry, deep clone, deep equal, flatten
- [ ] Your own `map`, `filter`, `reduce`, `bind`, `Promise.all`
- [ ] Event emitter / pub-sub, observer, singleton, factory, module pattern
- [ ] See the JS section of [problem-solving/README.md](../problem-solving/README.md)

## 18. The web platform
- [ ] HTTP basics, REST, JSON, status codes
- [ ] **CORS** and the same-origin policy; preflight requests
- [ ] Cookies (`HttpOnly`, `Secure`, `SameSite`), token storage trade-offs (localStorage vs cookies)
- [ ] XSS and CSRF from the front-end side
- [ ] WebSockets, Server-Sent Events, polling
- [ ] Web performance basics: lazy loading, code splitting, caching, CDNs **(mid)**
- [ ] Memory leaks: forgotten listeners, timers, closures, detached DOM nodes **(mid)**

## 19. Dates and internationalisation
- [ ] `Date` pitfalls (months start at 0, time zones, parsing), `toISOString`
- [ ] `Intl.NumberFormat`, `Intl.DateTimeFormat`, `Intl.RelativeTimeFormat`; libraries (date-fns, Day.js)

## 20. TypeScript basics (asked more and more)
- [ ] Why TypeScript; type annotations, inference
- [ ] `type` vs `interface`, union and intersection types, literal types, optional properties
- [ ] `any` vs `unknown` vs `never`, type narrowing and type guards
- [ ] Generics; utility types (`Partial`, `Pick`, `Omit`, `Record`, `ReturnType`)
- [ ] Typing React props and state **(mid)**

## 21. Node.js basics
- [ ] What Node is (V8 plus libuv), the non-blocking I/O model, the event loop in Node
- [ ] `process.env`, `process.argv`, built-in modules (`fs`, `path`, `http`), npm scripts
- [ ] Express basics: routes, middleware, `req` / `res` (useful for MERN questions)

## 22. ES versions (for "what came in ES6?" questions)
- [ ] **ES6 / ES2015**: `let` / `const`, arrow functions, classes, template literals, destructuring, default, rest and spread parameters, promises, modules, `Map` / `Set`, symbols, iterators and generators, `for...of`
- [ ] ES2016–2019: `includes`, `**`, `async` / `await`, object spread, `Object.entries`, `flat`, `fromEntries`
- [ ] ES2020+: `?.`, `??`, `BigInt`, `Promise.allSettled`, `globalThis`, `replaceAll`, logical assignment, `at`, `Object.hasOwn`, top-level `await`, `toSorted` and friends, `Object.groupBy`, set methods, iterator helpers
