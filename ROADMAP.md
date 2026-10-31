# Roadmap

A complete checklist of what to know for a **Ruby on Rails developer** role (junior to mid level) with JavaScript and React on the front end.

It deliberately includes **the basics taught early in a career** that you may have forgotten because you rarely use them, because interviewers ask about those just as often as about advanced topics.

**How to use it**
- Work through the checklists from top to bottom, or start with the areas where you're weakest.
- Tick an item only when you can **explain it out loud and write the code without looking it up**.
- Items marked **(mid)** are what usually separate a mid-level developer from a junior one.
- Practise answering with [interview/questions.md](interview/questions.md).

---

## Detailed checklists

| Checklist | What it covers |
|---|---|
| 💎 **[Ruby](roadmap/ruby.md)** | Basics, core types and their methods, blocks and procs, Enumerable, OOP, modules, exceptions, metaprogramming, gems, concurrency, version changes, output puzzles |
| 🛤️ **[Rails](roadmap/rails.md)** | Conventions, CLI, routing, controllers, views, Active Record (migrations, validations, callbacks, associations, querying), Active Support, Hotwire, auth, mailers, jobs, Action Cable, Active Storage, caching, security, Rack, testing, APIs, deployment, patterns, gems, version history |
| 🟨 **[JavaScript](roadmap/javascript.md)** | Scope and hoisting, types and coercion, functions and closures, `this`, objects, arrays, prototypes and classes, the event loop and promises, modules, the DOM and events, common utilities, the web platform, TypeScript and Node basics, ES versions |
| ⚛️ **[React](roadmap/react.md)** | JSX, components and props, state, rendering behaviour, effects, hooks, forms, context and state management, routing, performance, React 18/19, working with a Rails API, testing |

The sections below cover the shared knowledge every role expects.

---

## 1. Programming fundamentals
- [ ] Data types, control flow, functions, recursion, scope
- [ ] **Big-O**: time and space complexity; the cost of common operations on arrays, hashes, sets and sorting
- [ ] **OOP**: encapsulation, inheritance, polymorphism, abstraction; classes vs objects; interfaces and duck typing
- [ ] **SOLID**, DRY, KISS, YAGNI, composition over inheritance, separation of concerns
- [ ] Common design patterns: singleton, factory, strategy, observer, decorator, adapter, service object
- [ ] Data structures: array, linked list, stack, queue, hash table, set, tree, binary search tree, heap, graph
- [ ] Algorithms: linear and binary search; bubble, selection, insertion, merge and quick sort; recursion; BFS / DFS
- [ ] Compiled vs interpreted languages, static vs dynamic typing, strong vs weak typing
- [ ] Processes vs threads, concurrency vs parallelism, race conditions

## 2. How the web works
- [ ] What happens when you type a URL into the browser (DNS → TCP/TLS → HTTP request → server → response → rendering)
- [ ] **HTTP**: methods (GET, POST, PUT, PATCH, DELETE), **idempotency** and **safe methods**, request and response structure, headers
- [ ] **Status codes**: 200, 201, 204, 301, 302, 303, 304, 400, 401, 403, 404, 409, 422, 429, 500, 502, 503
- [ ] HTTP is stateless; cookies, sessions, tokens; `Set-Cookie` attributes (`HttpOnly`, `Secure`, `SameSite`, `Expires`)
- [ ] HTTPS and TLS basics, certificates
- [ ] **REST**: resources, nouns vs verbs, nested resources, what makes an API RESTful; REST vs GraphQL vs RPC
- [ ] JSON, content types (`Content-Type`, `Accept`)
- [ ] **CORS** and the same-origin policy
- [ ] Caching headers: `Cache-Control`, `ETag`, `Last-Modified`
- [ ] Authentication vs authorization; sessions vs JWTs; OAuth 2.0 basics
- [ ] WebSockets vs polling vs Server-Sent Events
- [ ] Web servers vs app servers, reverse proxies, load balancers, CDNs

## 3. HTML and CSS
- [ ] Semantic HTML (`header`, `nav`, `main`, `section`, `article`, `footer`), forms and input types, tables, `meta` tags
- [ ] Block vs inline vs inline-block elements
- [ ] **The box model**, `box-sizing: border-box`, margin collapse
- [ ] **Specificity** and the cascade, inheritance, `!important`
- [ ] Positioning: `static`, `relative`, `absolute`, `fixed`, `sticky`; `z-index`
- [ ] **Flexbox** and **Grid**: the main properties, centering things
- [ ] Responsive design: media queries, mobile-first, `rem` / `em` / `%` / `vw`, the viewport meta tag
- [ ] Pseudo-classes and pseudo-elements, CSS variables, transitions
- [ ] Tailwind and Bootstrap basics; preprocessors (Sass)
- [ ] Accessibility basics: `alt` text, labels, contrast, keyboard navigation

## 4. SQL and databases
- [ ] SQL vs NoSQL; relational concepts (tables, rows, columns, schemas)
- [ ] `SELECT`, `WHERE`, `ORDER BY`, `LIMIT` / `OFFSET`, `DISTINCT`, aliases, `LIKE` / `ILIKE`, `IN`, `BETWEEN`, `IS NULL`
- [ ] Aggregates: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`; `GROUP BY`; **`WHERE` vs `HAVING`**
- [ ] **JOINs**: INNER, LEFT, RIGHT, FULL, CROSS, self joins; joining several tables
- [ ] Subqueries (correlated vs uncorrelated), `EXISTS`, `UNION` vs `UNION ALL`
- [ ] `INSERT`, `UPDATE`, `DELETE`; **`DELETE` vs `TRUNCATE` vs `DROP`**
- [ ] DDL vs DML; `CREATE TABLE`, `ALTER TABLE`, data types
- [ ] Keys: primary, foreign, composite, natural vs surrogate; constraints (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`)
- [ ] Relationships: one-to-one, one-to-many, many-to-many (join tables)
- [ ] **Normalization** (1NF, 2NF, 3NF) and when to denormalize
- [ ] **Transactions and ACID**; `COMMIT` / `ROLLBACK`
- [ ] **Indexes**: how they work (B-tree), composite index column order, unique indexes, the cost of indexes on writes **(mid)**
- [ ] `EXPLAIN` / `EXPLAIN ANALYZE`, sequential vs index scans **(mid)**
- [ ] Isolation levels, dirty, non-repeatable and phantom reads, locking, deadlocks **(mid)**
- [ ] Window functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `PARTITION BY`), CTEs (`WITH`) **(mid)**
- [ ] Views and materialized views, stored procedures and triggers (just know what they are)
- [ ] PostgreSQL vs MySQL differences; `jsonb`, arrays and full-text search in Postgres
- [ ] Classic queries: the Nth highest salary, duplicates, rows with no matching row, top N per group, running totals
- [ ] Redis basics: what it is and how Rails uses it (cache, Sidekiq, Action Cable)

## 5. Testing (general)
- [ ] Unit vs integration vs end-to-end tests, the testing pyramid
- [ ] TDD and BDD; red → green → refactor
- [ ] Mocks, stubs, spies and fakes
- [ ] What to test and what not to test; test coverage
- [ ] Rails-specific details are in [roadmap/rails.md](roadmap/rails.md#22-testing), React-specific ones in [roadmap/react.md](roadmap/react.md#15-testing)

## 6. Tools and workflow
- [ ] **Git**: `init`, `clone`, `status`, `add`, `commit`, `push`, `pull` vs `fetch`, branches, **merge vs rebase**, resolving conflicts, `stash`, `cherry-pick`, `reset` (soft, mixed, hard) vs `revert`, `log`, `diff`, `blame`, `tag`, `.gitignore`
- [ ] Branching strategies (GitHub Flow, Git Flow), pull requests, code review etiquette, good commit messages
- [ ] **Linux and the command line**: navigation, permissions (`chmod`), processes (`ps`, `kill`), `grep`, `tail -f`, environment variables, SSH and keys
- [ ] **Docker**: images vs containers, `Dockerfile`, `docker compose`, volumes, ports
- [ ] **CI/CD**: GitHub Actions running tests, linters and security scans; deploy pipelines
- [ ] Cloud basics: what EC2, S3 and RDS are (or their equivalents); Heroku / Render
- [ ] **Agile / Scrum**: sprints, standups, retrospectives, story points, Jira

## 7. Problem solving
- [ ] Work through the checklist in [problem-solving/README.md](problem-solving/README.md)
- [ ] Patterns: hash maps for counting and lookups, two pointers, sliding window, prefix sums, stacks (brackets, next greater element), queues, binary search, recursion and backtracking, sorting
- [ ] Strings: palindromes, anagrams, reversing, character counts, substrings
- [ ] Linked lists, trees (traversals: in-order, pre-order, post-order, level order) and graphs (BFS / DFS) **(mid)**
- [ ] Dynamic programming basics (Fibonacci, climbing stairs, coin change) **(mid)**
- [ ] Say your approach out loud, start with brute force, then optimise and state the complexity

## 8. System design basics **(mid)**
- [ ] Designing a database schema for a feature (e-commerce, booking, chat, blog with comments and tags)
- [ ] Designing the API endpoints for that feature
- [ ] Scaling: vertical vs horizontal, load balancing, caching layers, background processing, read replicas, a CDN, database indexing and partitioning
- [ ] Monolith vs microservices; why most Rails apps stay a monolith
- [ ] Handling high traffic, rate limiting, queues, idempotency
- [ ] Common exercises: a URL shortener, a notification system, a booking system, a CSV import for 100k rows, multi-tenant SaaS

## 9. Interview readiness
- [ ] Read [interview/README.md](interview/README.md): how hiring works, salary, take-home assignments
- [ ] Practise with [interview/questions.md](interview/questions.md)
- [ ] One project you can explain in depth: architecture, decisions, problems you solved
- [ ] Your "tell me about yourself" pitch (60–90 seconds)
- [ ] STAR stories: a hard bug, a mistake, a disagreement, a project you're proud of
- [ ] Questions to ask the interviewer

---

## Later
- [ ] Next.js
- [ ] Python
- [ ] n8n
- [ ] Generative AI (LLMs, RAG, prompting, agents)
