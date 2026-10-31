# Roadmap

A checklist of what to know for a **Ruby on Rails developer** role, from junior to mid level, with React as the frontend. Work through it from top to bottom, or jump to the areas where you're weakest.

- Items marked **(mid)** are what usually separates a mid-level developer from a junior one.
- Once you can explain a topic out loud and write the code without looking it up, tick it off.
- For interview questions on these topics, see [interview/questions.md](interview/questions.md).

---

## 1. Programming fundamentals
- [ ] Variables, types, control flow, functions, recursion
- [ ] Big-O for time and space; know the complexity of common operations on arrays, hashes and sets
- [ ] OOP: encapsulation, inheritance, polymorphism, abstraction
- [ ] SOLID principles, composition vs inheritance, DRY, YAGNI
- [ ] How the web works: HTTP methods, status codes, headers, cookies, sessions, DNS, HTTPS
- [ ] REST: resources, idempotency, which status code to return when

## 2. Ruby
- [ ] Core types: String, Symbol, Integer/Float, Array, Hash, Range, `nil`
- [ ] Enumerable: `each`, `map`, `select`, `reject`, `reduce`, `each_with_object`, `group_by`, `tally`, `partition`, `zip`, `each_slice`, `sort_by`, `min_by`
- [ ] Blocks, `yield`, `block_given?`, procs vs lambdas, closures
- [ ] Classes and objects: `initialize`, `attr_*`, `self`, class vs instance methods, visibility (`private` / `protected`)
- [ ] Modules: mixins (`include` / `extend` / `prepend`), namespacing, method lookup (`ancestors`)
- [ ] Exceptions: `begin` / `rescue` / `ensure` / `retry`, custom error classes
- [ ] Equality (`==`, `eql?`, `equal?`, `===`), `dup` vs `clone`, `freeze`
- [ ] Modern Ruby: pattern matching, `it`, `Data.define`, hash shorthand ([refreshers/ruby.md](refreshers/ruby.md))
- [ ] Metaprogramming basics: `send`, `define_method`, `method_missing` **(mid)**
- [ ] Threads, the GVL, and when concurrency helps **(mid)**

## 3. SQL and databases
- [ ] SELECT, WHERE, ORDER BY, LIMIT/OFFSET, GROUP BY, HAVING
- [ ] JOINs: INNER, LEFT, RIGHT, FULL, self join
- [ ] Aggregates and subqueries; classic problems such as the second highest salary or duplicate rows
- [ ] Primary and foreign keys, constraints, normalization (1NF to 3NF)
- [ ] Transactions and ACID
- [ ] Indexes: B-tree, composite, unique; when an index hurts; reading `EXPLAIN` **(mid)**
- [ ] Isolation levels, locking (optimistic and pessimistic), deadlocks **(mid)**
- [ ] Window functions (`ROW_NUMBER`, `RANK`), CTEs **(mid)**
- [ ] PostgreSQL basics: `jsonb`, arrays, `psql`

## 4. Rails core
- [ ] MVC and the request lifecycle (Rack → middleware → router → controller → view)
- [ ] Generators, migrations (`change` vs `up` / `down`), `schema.rb`, seeds
- [ ] Routing: `resources`, nested routes, member vs collection, namespaces
- [ ] Controllers: filters (`before_action`), strong params (`params.expect`), `render` vs `redirect_to`, `respond_to`
- [ ] Views: layouts, partials, helpers, form helpers (`form_with`)
- [ ] Active Record: CRUD, `find` / `find_by` / `where`, scopes, validations, callbacks
- [ ] Associations: `belongs_to`, `has_many`, `has_one`, `has_many :through`, `dependent:`, polymorphic, STI
- [ ] Query methods: `pluck`, `select`, `joins`, `group`, `order`, `find_each`, `exists?`
- [ ] Sessions, cookies, flash
- [ ] Authentication (`has_secure_password`, the Rails 8 generator, Devise) and authorization (Pundit / CanCanCan)
- [ ] Credentials and environment config
- [ ] Hotwire: Turbo Drive, Turbo Frames, Turbo Streams, Stimulus
- [ ] Active Storage (file uploads), Action Mailer
- [ ] What's new in Rails 7 and 8 ([refreshers/rails.md](refreshers/rails.md))

## 5. Rails in production **(mid)**
- [ ] N+1 queries: `includes` / `preload` / `eager_load`, `strict_loading`, the Bullet gem
- [ ] Counter caches, database indexes for associations, batch processing
- [ ] Background jobs: Active Job, Sidekiq / Solid Queue, retries, idempotency
- [ ] Caching: fragment caching, Russian-doll caching, low-level `Rails.cache.fetch`, cache invalidation
- [ ] Service objects, form objects, query objects, concerns, and when to use each
- [ ] `after_commit` vs `after_save`; transactions inside callbacks
- [ ] Action Cable / WebSockets basics
- [ ] Security: CSRF, XSS, SQL injection, mass assignment, secure headers, Brakeman
- [ ] Logging, error tracking (Sentry, Honeybadger), APM (New Relic, Skylight)
- [ ] Deployment: Heroku / Render / Kamal / Capistrano, environment variables, running migrations safely
- [ ] Upgrading a Rails version and handling deprecations

## 6. Building APIs with Rails
- [ ] `rails new --api`, JSON rendering, serializers (Jbuilder, `as_json`, Alba / Blueprinter)
- [ ] Consistent error responses and status codes
- [ ] Token authentication (JWT or a signed token), CORS (`rack-cors`)
- [ ] Pagination (Pagy / Kaminari), filtering, sorting
- [ ] API versioning (`/api/v1`) **(mid)**
- [ ] Rate limiting (Rails 8 `rate_limit`, Rack::Attack) **(mid)**
- [ ] Calling third-party APIs: Faraday / Net::HTTP, timeouts, retries, webhooks **(mid)**

## 7. Testing
- [ ] RSpec or Minitest basics: model, request and system specs
- [ ] FactoryBot vs fixtures, Faker
- [ ] Mocks, stubs and doubles; WebMock / VCR for HTTP
- [ ] The testing pyramid, and what's worth testing
- [ ] TDD workflow; test coverage (SimpleCov) **(mid)**

## 8. JavaScript and React
- [ ] JS fundamentals: scope, closures, `this`, prototypes, the event loop ([refreshers/javascript.md](refreshers/javascript.md))
- [ ] Promises, `async` / `await`, `fetch`, error handling
- [ ] DOM basics and events (useful for Stimulus as well)
- [ ] React: components, props, state, hooks, lists and keys, forms
- [ ] React with a Rails API: CORS, auth tokens, loading and error states
- [ ] React Router; state management (Context, TanStack Query, Redux basics)
- [ ] React 19 features, and when re-renders happen **(mid)**

## 9. Tools and workflow
- [ ] Git: branching, rebase vs merge, resolving conflicts, `stash`, `cherry-pick`, writing good commit messages
- [ ] Pull requests and code review etiquette
- [ ] Linux command line basics, SSH
- [ ] Docker basics: `Dockerfile`, `docker compose`
- [ ] CI (GitHub Actions): running tests and linters (RuboCop) on each PR
- [ ] Agile / Scrum: standups, sprints, estimation, Jira

## 10. Problem solving
- [ ] Work through the checklist in [problem-solving/README.md](problem-solving/README.md)
- [ ] Patterns: hash maps, two pointers, sliding window, stacks and queues, binary search, recursion, sorting
- [ ] Trees and graphs: BFS / DFS **(mid)**
- [ ] Practise talking through your approach out loud and stating the complexity

## 11. System design basics **(mid)**
- [ ] Design a small system end to end: a URL shortener, a booking system, a notification system
- [ ] Database schema design for a given feature
- [ ] Scaling: caching layers, background processing, read replicas, a CDN
- [ ] Trade-offs: a monolith vs services, SQL vs NoSQL

## 12. Interview readiness
- [ ] Read [interview/README.md](interview/README.md): how hiring works and how to prepare
- [ ] Practise with [interview/questions.md](interview/questions.md)
- [ ] One project you can explain in depth: architecture, decisions, problems you solved
- [ ] Your "tell me about yourself" pitch (60–90 seconds)
- [ ] Questions to ask the interviewer

---

## Later
- [ ] Next.js
- [ ] Python
- [ ] n8n
- [ ] Generative AI (LLMs, RAG, prompting, agents)
