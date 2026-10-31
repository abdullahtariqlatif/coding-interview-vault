# Interview Questions: Ruby on Rails (junior to mid)

Questions commonly asked in Rails interviews for 0–3 years of experience. Try to answer each one out loud before opening the answer. Questions marked **(mid)** are what usually puts you in a higher band.

**Contents:** [Ruby](#ruby) · [OOP & design](#oop--design) · [Rails](#rails) · [Active Record](#active-record) · [SQL](#sql) · [APIs & HTTP](#apis--http) · [Performance & production](#performance--production-mid) · [Security](#security) · [Testing](#testing) · [JavaScript & React](#javascript--react) · [Git & tools](#git--tools) · [System design](#system-design-mid) · [Live coding tasks](#common-live-coding-tasks) · [Behavioural & HR](#behavioural--hr) · [Questions to ask them](#questions-to-ask-them)

---

## Ruby

<details><summary>What's the difference between a Symbol and a String?</summary>

A Symbol is immutable and **interned**: every `:name` is the same object (same `object_id`), so symbols are cheap to compare and good for hash keys and identifiers. Strings can be changed and are usually separate objects (unless frozen). Use symbols for names and keys, and strings for text data.
</details>

<details><summary>What's the difference between a block, a proc and a lambda?</summary>

- A **block** is a chunk of code passed to a method (`{ }` / `do end`). It isn't an object; the method runs it with `yield`.
- A **proc** (`Proc.new { }` / `proc { }`) is a block stored as an object. It's **lenient about arguments**, and **`return` inside it returns from the method that defined it**.
- A **lambda** (`->(x) { }`) **checks the number of arguments** like a method, and **`return` exits only the lambda**.
</details>

<details><summary>What's the difference between <code>include</code>, <code>extend</code> and <code>prepend</code>?</summary>

- `include M` adds M's methods as **instance methods**; M goes *after* the class in the lookup chain.
- `extend M` adds M's methods as **class methods** (more precisely, to that object's singleton class).
- `prepend M` puts M *before* the class in the lookup chain, so M's methods run first and can call `super` to reach the class's version. It's useful for wrapping or decorating methods.

Check the order with `MyClass.ancestors`.
</details>

<details><summary>What's the difference between <code>==</code>, <code>eql?</code>, <code>equal?</code> and <code>===</code>?</summary>

- `==` compares values (`1 == 1.0` is true).
- `eql?` compares value **and type**, and is used for hash keys (`1.eql?(1.0)` is false).
- `equal?` checks whether both are **the same object** (identity).
- `===` is "case equality", used by `case/when`: `Integer === 5`, `(1..10) === 5`, `/ab/ === "abc"`.
</details>

<details><summary>Explain <code>public</code>, <code>private</code> and <code>protected</code>.</summary>

- Public methods can be called from anywhere.
- Private methods can only be called without an explicit receiver (or with `self.` since Ruby 2.7), so only from inside the object itself.
- Protected methods can be called by **other instances of the same class**, which is useful for comparisons such as `other.balance`.
</details>

<details><summary>What's the difference between <code>dup</code> and <code>clone</code>?</summary>

Both make a **shallow** copy. `clone` also copies the **frozen state** and **singleton methods**; `dup` doesn't. For a deep copy, use `Marshal.load(Marshal.dump(obj))` or `deep_dup` in Rails.
</details>

<details><summary>Class variables (<code>@@</code>) vs class instance variables (<code>@</code> at class level)?</summary>

A `@@var` is **shared by the class and all its subclasses**, so a subclass that changes it changes it for the parent too, which causes surprising bugs. A class-level `@var` belongs only to that class object. Prefer class instance variables, or `class_attribute` in Rails.
</details>

<details><summary>What do <code>map</code>, <code>each</code>, <code>select</code>, <code>reduce</code> and <code>each_with_object</code> return?</summary>

- `each` returns the original collection; use it for side effects.
- `map` returns a new array of the block's results.
- `select` / `reject` return the elements the block keeps or drops.
- `reduce(init) { |acc, x| }` folds the collection into one value.
- `each_with_object({}) { |x, memo| }` builds an object (such as a hash) and returns it, without needing to return the accumulator from the block.
</details>

<details><summary>How do you handle exceptions? How do you write a custom error?</summary>

```ruby
class PaymentError < StandardError; end

begin
  charge!
rescue PaymentError, Timeout::Error => e
  retry if (attempts += 1) < 3
  logger.error(e.message)
ensure
  cleanup  # always runs
end
```
Rescue `StandardError` (the default for a bare `rescue`), never `Exception`, because `Exception` also catches signals and `exit`.
</details>

<details><summary>What is <code>method_missing</code>? When would you use it? <b>(mid)</b></summary>

Ruby calls `method_missing` when an object receives a method it doesn't define. It's used for dynamic proxies and DSLs (Active Record's old `find_by_name` worked this way). Always pair it with `respond_to_missing?`, and call `super` for names you don't handle. Prefer `define_method` when the method names are known ahead of time, because it's faster and easier to discover.
</details>

<details><summary>What is the GVL (GIL)? Do threads help in Ruby? <b>(mid)</b></summary>

In CRuby, the Global VM Lock lets only one thread run Ruby code at a time. Threads still help with **I/O-bound** work (HTTP calls, DB queries), because the lock is released while waiting. For CPU-bound parallelism, use multiple processes (Puma workers, Sidekiq processes) or Ractors.
</details>

<details><summary>What's new in modern Ruby?</summary>

Pattern matching (`case/in`), endless methods, hash shorthand `{x:, y:}`, `Data.define`, the `it` block parameter, YJIT, and Prism as the default parser. See [refreshers/ruby.md](../refreshers/ruby.md).
</details>

**Also asked:** `nil?` vs `empty?` vs `blank?` vs `present?` (the last two come from Rails) · `attr_accessor` / `attr_reader` · `self` in different contexts · `super` vs `super()` · `Comparable` with `<=>` · `freeze` and the frozen string literal comment · `Struct` vs `Data` vs `OpenStruct` · safe navigation `&.`

---

## OOP & design

<details><summary>What are the four pillars of OOP? Give a Ruby example of each.</summary>

- **Encapsulation**: hide state behind methods (`attr_reader` plus private setters).
- **Inheritance**: `class Admin < User`.
- **Polymorphism**: different classes respond to the same message, such as `shape.area` for both `Circle` and `Square` (duck typing in Ruby).
- **Abstraction**: expose a simple interface (`PaymentGateway#charge`) and hide the details.
</details>

<details><summary>Explain SOLID.</summary>

- **S**ingle responsibility: one reason to change (pull a fat model's logic into a service object).
- **O**pen/closed: extend behaviour without editing existing code (strategies, polymorphism).
- **L**iskov substitution: a subclass must work anywhere its parent does.
- **I**nterface segregation: small, focused interfaces and modules.
- **D**ependency inversion: depend on abstractions, and inject dependencies (`Notifier.new(sender: SmsSender.new)`).
</details>

<details><summary>Composition vs inheritance?</summary>

Inheritance is an "is-a" relationship and couples the child tightly to the parent. Composition is a "has-a" relationship: you build behaviour from objects or modules. Prefer composition because it's more flexible and easier to test. Use inheritance for true specialisation, such as STI models or `ApplicationController`.
</details>

<details><summary>Which design patterns have you used in Rails? <b>(mid)</b></summary>

- **Service object**: one business action (`Orders::Checkout.call(order)`).
- **Form object**: validations across several models (an `ActiveModel::Model` class).
- **Query object**: complex, reusable queries.
- **Decorator / presenter**: view formatting logic (Draper or a plain Ruby object).
- **Observer**: callbacks, `ActiveSupport::Notifications`.
- **Strategy**: swappable payment providers.
- **Adapter**: wrapping third-party APIs.
</details>

---

## Rails

<details><summary>Explain MVC and walk through a Rails request.</summary>

The browser sends a request. The web server (Puma) passes it to **Rack middleware** (sessions, cookies, CSRF), then the **router** (`config/routes.rb`) maps it to `Controller#action`. Before-actions run, the controller talks to **models** (Active Record), and then renders a **view** (or JSON) or redirects. The response travels back up through the middleware.
</details>

<details><summary>What's the difference between <code>render</code> and <code>redirect_to</code>?</summary>

`render` builds the response in the **same request**, using a template; instance variables are available and nothing new is requested. `redirect_to` sends a **3xx** response telling the browser to make a **new request** to another URL. Use the pattern redirect after a successful POST, and render (with `status: :unprocessable_entity`) when validation fails.
</details>

<details><summary>What are strong parameters? What's <code>params.expect</code>?</summary>

They protect against **mass assignment** by letting through only the attributes you allow: `params.require(:user).permit(:name, :email)`. Rails 8 adds `params.expect(user: [:name, :email])`, which also returns a **400** instead of a 500 when the params have the wrong shape.
</details>

<details><summary>What's the difference between member and collection routes?</summary>

```ruby
resources :photos do
  member     { post :publish }   # /photos/:id/publish → acts on one record
  collection { get :search }     # /photos/search       → acts on the collection
end
```
</details>

<details><summary>What's the difference between <code>before_action</code>, <code>after_action</code> and <code>around_action</code>?</summary>

Controller filters. `before_action` runs before the action, for authentication or loading a record; if it renders or redirects, the action doesn't run. `after_action` runs after it. `around_action` wraps the action using `yield`. Use `only:` / `except:` to limit which actions they apply to.
</details>

<details><summary>What are concerns? When would you use them?</summary>

Modules built on `ActiveSupport::Concern` that share behaviour (associations, scopes, methods) across models or controllers through `included do ... end` and `class_methods do ... end`. Good uses are `Taggable` or `SoftDeletable`. Don't use them only to split up a fat model; that hides the complexity instead of reducing it.
</details>

<details><summary>What's the difference between <code>rails db:migrate</code>, <code>db:schema:load</code>, <code>db:rollback</code> and <code>db:seed</code>?</summary>

- `migrate` runs pending migrations and updates `schema.rb`.
- `schema:load` builds the database straight from `schema.rb`; it's faster and is what you use for new environments.
- `rollback` reverts the last migration (`STEP=n` for more).
- `seed` runs `db/seeds.rb`.

`db:prepare` creates the database or migrates it, whichever is needed.
</details>

<details><summary>What's the difference between <code>change</code> and <code>up</code>/<code>down</code> in migrations?</summary>

Rails knows how to reverse most operations written in `change` (`add_column`, `create_table`). Use `up` / `down`, or `reversible`, for operations that can't be reversed automatically, such as `execute` with raw SQL or changing data.
</details>

<details><summary>What's new in Rails 7 and 8?</summary>

Hotwire and import maps by default; Rails 8's Solid Queue, Solid Cache and Solid Cable (no Redis needed); the authentication generator; Propshaft; Kamal 2; `params.expect`; `normalizes`. See [refreshers/rails.md](../refreshers/rails.md).
</details>

<details><summary>What are Turbo Frames and Turbo Streams?</summary>

**Turbo Drive** turns link clicks and form submissions into fetch requests without full page reloads. A **Turbo Frame** (`turbo_frame_tag`) replaces just one part of the page with the matching frame from the response. **Turbo Streams** send small actions (`append`, `replace`, `remove`) over HTTP responses or WebSockets to update several parts of the page. **Stimulus** adds small bits of JS behaviour through `data-controller` attributes.
</details>

**Also asked:** environments and `config/environments/*` · credentials (`rails credentials:edit`) · `ApplicationController` and inheritance · layouts, partials and `yield` / `content_for` · `form_with` · flash vs `flash.now` · Active Storage · Action Mailer with `deliver_later` · helpers · the asset pipeline vs import maps vs jsbundling · `rails console` / `rails routes`

---

## Active Record

<details><summary>What's the difference between <code>find</code>, <code>find_by</code> and <code>where</code>?</summary>

`find(id)` returns a record or **raises** `RecordNotFound` (which Rails turns into a 404). `find_by(attr: v)` returns the first match or **nil**. `where(...)` returns a lazy **Relation** (zero or more records) that you can keep chaining.
</details>

<details><summary>What's the difference between <code>save</code> and <code>save!</code>, and <code>create</code> and <code>create!</code>?</summary>

The versions without `!` return `false` (or an unsaved object) when validation fails. The bang versions **raise** `ActiveRecord::RecordInvalid`. Use bang methods inside transactions or scripts, where a silent failure would be a bug.
</details>

<details><summary>What's the difference between <code>update</code>, <code>update_attribute</code>, <code>update_column</code> and <code>update_all</code>?</summary>

- `update`: validations ✅, callbacks ✅, `updated_at` ✅.
- `update_attribute`: **skips validations**; callbacks ✅.
- `update_column(s)`: skips validations and callbacks, and doesn't touch `updated_at`; it's a direct SQL update.
- `update_all`: a single SQL UPDATE on the whole relation; no instances are loaded and no callbacks run.
</details>

<details><summary>What's the difference between <code>destroy</code> and <code>delete</code>, and <code>dependent: :destroy</code> and <code>:delete_all</code>?</summary>

`destroy` loads the record and runs callbacks, including `dependent` on associations. `delete` runs a plain SQL DELETE. `dependent: :destroy` destroys each child one by one (callbacks run, slow for many children). `:delete_all` deletes the children in one SQL query (no callbacks). `:nullify` sets the foreign key to NULL.
</details>

<details><summary>When would you use <code>has_many :through</code> instead of <code>has_and_belongs_to_many</code>?</summary>

HABTM uses a join table with no model of its own, so you can't add attributes to it. `has_many :through` uses a real join model (`Membership` with `role` and `joined_at`), which supports validations and callbacks. Prefer `:through` in almost every case.
</details>

<details><summary>What is a polymorphic association? Give an example.</summary>

One model belongs to more than one other model through a single association:
```ruby
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true   # commentable_type + commentable_id
end
class Post  < ApplicationRecord; has_many :comments, as: :commentable; end
class Photo < ApplicationRecord; has_many :comments, as: :commentable; end
```
The downside is that the database can't enforce a foreign key on it.
</details>

<details><summary>What is STI? What are its downsides?</summary>

Single Table Inheritance: subclasses share one table, and a `type` column stores the class name (`Admin < User`). It's simple, but the table fills with columns that are NULL for most subclasses, and it doesn't work well when the subclasses' data differs a lot. Alternatives are a polymorphic association, `delegated_type`, or separate tables.
</details>

<details><summary>Scopes vs class methods?</summary>

Both can be chained. A **scope** always returns a relation; if its body returns `nil`, it returns `all` instead, so chains don't break. A class method can return anything, including nil. Use scopes for simple, reusable filters (`scope :active, -> { where(active: true) }`).
</details>

<details><summary>What's the difference between <code>pluck</code>, <code>select</code> and <code>map</code>?</summary>

`pluck(:email)` runs `SELECT email` and returns **plain values**, with no model objects; it's the fastest. `select(:id, :email)` returns **model objects** with only those attributes loaded. `map(&:email)` loads **full records** into memory first and then maps over them, which is the slowest. (`map` on a relation that's already loaded doesn't run another query.)
</details>

<details><summary>What's the callback order? <code>after_save</code> vs <code>after_commit</code>? <b>(mid)</b></summary>

On create: `before_validation` → `after_validation` → `before_save` → `before_create` → INSERT → `after_create` → `after_save` → *(the transaction commits)* → `after_commit`.

`after_save` runs **inside** the transaction, so if you enqueue a job there, the job can run before the commit and not find the record. Use `after_commit` (or `after_create_commit`) for jobs, emails and external API calls.
</details>

<details><summary>How do you validate uniqueness safely? <b>(mid)</b></summary>

`validates :email, uniqueness: true` alone has a **race condition**: two requests can both check, find nothing, and both insert. Add a **unique index** in the database (`add_index :users, :email, unique: true`) and handle `ActiveRecord::RecordNotUnique`.
</details>

<details><summary>How do transactions work in Rails? <b>(mid)</b></summary>

```ruby
ActiveRecord::Base.transaction do
  from.update!(balance: from.balance - amt)
  to.update!(balance: to.balance + amt)
end
```
Any exception rolls the whole block back. Use bang methods inside it so failures raise. Raise `ActiveRecord::Rollback` to roll back without the exception propagating. Note that nested `transaction` blocks join the outer transaction unless you pass `requires_new: true`.
</details>

<details><summary>What's the difference between optimistic and pessimistic locking? <b>(mid)</b></summary>

- **Optimistic:** add a `lock_version` column. Rails raises `StaleObjectError` if the row changed since you read it. Good when conflicts are rare.
- **Pessimistic:** `record.lock!` or `with_lock { }` runs `SELECT ... FOR UPDATE` and blocks other writers until commit. Use it for money and inventory counters.
</details>

**Also asked:** `counter_cache` · `find_each` / `in_batches` for large tables · `exists?` vs `present?` vs `any?` · enums · `has_secure_password` · default scopes and why they cause problems · `touch: true` · `inverse_of` · `accepts_nested_attributes_for` · `normalizes`

---

## SQL

Expect to write at least one query by hand, often on paper or in a shared editor.

<details><summary>Find the second highest salary.</summary>

```sql
SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- or, for the Nth highest:
SELECT DISTINCT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 1;

-- or with a window function:
SELECT salary FROM (
  SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS r FROM employees
) t WHERE r = 2;
```
</details>

<details><summary>Count employees per department, showing only departments with more than 5.</summary>

```sql
SELECT d.name, COUNT(e.id) AS total
FROM departments d
LEFT JOIN employees e ON e.department_id = d.id
GROUP BY d.id, d.name
HAVING COUNT(e.id) > 5;
```
In Rails: `Department.left_joins(:employees).group(:id).having("COUNT(employees.id) > 5").count`
</details>

<details><summary>Find duplicate emails.</summary>

```sql
SELECT email, COUNT(*) FROM users GROUP BY email HAVING COUNT(*) > 1;
```
</details>

<details><summary>Find users who have never placed an order.</summary>

```sql
SELECT u.* FROM users u
LEFT JOIN orders o ON o.user_id = u.id
WHERE o.id IS NULL;
```
In Rails: `User.where.missing(:orders)`
</details>

<details><summary>What's the difference between INNER, LEFT, RIGHT and FULL JOIN?</summary>

- **INNER**: only rows that match in both tables.
- **LEFT**: every row from the left table, with NULLs where there's no match on the right.
- **RIGHT**: the mirror of LEFT.
- **FULL**: every row from both tables.

In Rails, `joins` is an INNER JOIN and `left_joins` / `includes` + `references` is a LEFT JOIN.
</details>

<details><summary>What's the difference between WHERE and HAVING?</summary>

`WHERE` filters **rows before** grouping. `HAVING` filters **groups after** `GROUP BY`, and can use aggregates such as `COUNT(*) > 1`.
</details>

<details><summary>What is an index? When shouldn't you add one? <b>(mid)</b></summary>

A data structure (usually a B-tree) that speeds up lookups, sorting and joins on the indexed columns. Add indexes to foreign keys and to columns used in WHERE, ORDER BY and uniqueness checks. Every index **slows down writes** and uses storage, and it doesn't help much on low-variety columns such as a boolean. A composite index `(a, b)` helps queries on `a` or on `a AND b`, but not queries on `b` alone. Check whether a query uses an index with `EXPLAIN ANALYZE`.
</details>

<details><summary>What does ACID mean? What is normalization?</summary>

**ACID**: Atomicity (all or nothing), Consistency (constraints hold), Isolation (concurrent transactions don't interfere with each other), Durability (committed data survives a crash).

**Normalization** removes duplication. 1NF means atomic values; 2NF means no partial dependency on a composite key; 3NF means no dependency between non-key columns. Teams sometimes **denormalize** on purpose for read performance, as counter caches do.
</details>

---

## APIs & HTTP

<details><summary>What are the HTTP methods, and which are idempotent?</summary>

GET (read), POST (create), PUT (replace), PATCH (partial update), DELETE. **Idempotent** means repeating the request has the same effect as sending it once: GET, PUT, DELETE, HEAD and OPTIONS are; POST isn't, and PATCH isn't necessarily.
</details>

<details><summary>Which status codes should you know?</summary>

200 OK · 201 Created · 204 No Content · 301 / 302 redirects · 400 Bad Request · 401 Unauthorized (not logged in) · 403 Forbidden (logged in but not allowed) · 404 Not Found · 409 Conflict · 422 Unprocessable Entity (validation errors) · 429 Too Many Requests · 500 Internal Server Error · 503 Service Unavailable
</details>

<details><summary>How would you build authentication for a Rails API used by a React app?</summary>

Options:
1. **Session cookie**: same-site setup, httpOnly cookie, CSRF protection. Simplest when the frontend and API share a domain.
2. **Token / JWT**: log in returns a token, the client sends `Authorization: Bearer <token>`, and the server verifies it. It's stateless, but revoking tokens is harder; use short expiry plus refresh tokens.
3. **Devise + devise-jwt**, or Rails 8's authentication generator with token-based sessions.

Configure CORS with `rack-cors`, and always use HTTPS.
</details>

<details><summary>How do you version an API? How do you paginate? <b>(mid)</b></summary>

Versioning: a URL namespace (`/api/v1/...`, `namespace :api { namespace :v1 { ... } }`) or a header. Pagination: offset (`page`, `per_page`, with Pagy or Kaminari) or cursor-based (`after_id`), which works better on large tables that change often. Return pagination metadata in the response.
</details>

<details><summary>How do you call a slow third-party API from Rails? <b>(mid)</b></summary>

Don't call it inside the web request if you can avoid it. Move the call into a **background job**, set **timeouts** (open and read), **retry with backoff** for temporary errors, make the job **idempotent**, wrap the client in an adapter class, log failures, and use webhooks for callbacks. In tests, stub it with WebMock or VCR.
</details>

---

## Performance & production (mid)

<details><summary>What is an N+1 query? How do you find and fix it?</summary>

`Post.all.each { |p| p.author.name }` runs 1 query for the posts plus **N** queries for the authors. Fix it with `Post.includes(:author)`, which runs 2 queries. Find it in development logs or with the **Bullet** gem, or prevent it with `strict_loading`.
</details>

<details><summary>What's the difference between <code>includes</code>, <code>preload</code>, <code>eager_load</code> and <code>joins</code>?</summary>

- `preload`: always **separate queries** (`WHERE id IN (...)`).
- `eager_load`: **one query with a LEFT OUTER JOIN**; you can filter on the associated table.
- `includes`: Rails picks one of those two. It uses `eager_load` if you reference the association's table in `where` / `references`, otherwise `preload`.
- `joins`: an INNER JOIN used **only for filtering**; it doesn't load the association, so using it later still causes N+1.
</details>

<details><summary>A page is slow in production. How do you debug it?</summary>

1. Reproduce it and measure. Check the logs and APM (New Relic, Skylight, Scout) for time spent in the database vs Ruby vs views.
2. Database: N+1 queries, missing indexes (`EXPLAIN ANALYZE`), loading too many rows, slow queries.
3. Ruby: heavy loops, memory use, loading full records when `pluck` would do.
4. Fixes: eager loading, indexes, pagination, caching (fragment or `Rails.cache.fetch`), counter caches, moving work into background jobs.
5. Measure again to confirm the fix.
</details>

<details><summary>How do background jobs work? What makes a job idempotent?</summary>

`perform_later` adds the job to a queue (Sidekiq with Redis, or Solid Queue with the database); separate worker processes run it. Jobs can **retry**, so they should be **idempotent**: running one twice has the same effect as running it once. To get there, check state first (`return if order.paid?`), use unique keys, and do the work in database transactions. Pass **IDs, not objects**, as arguments.
</details>

<details><summary>How does caching work in Rails? How do you invalidate it?</summary>

- **Fragment caching:** `cache @product do ... end` in views. The key includes `updated_at`, so updating the record invalidates its cache automatically.
- **Russian-doll caching:** nested fragments plus `touch: true` on `belongs_to`, so updating a child invalidates its parent.
- **Low-level caching:** `Rails.cache.fetch("key", expires_in: 1.hour) { expensive }`.
- **Stores:** memory, Redis, Solid Cache.
- **HTTP caching:** `fresh_when` and `stale?` with ETags.
</details>

<details><summary>How would you add a column to a big production table without downtime?</summary>

Add the column as **nullable** without a default (or with a default on Postgres 11+, which is fast), **backfill in batches** in a job or rake task, then add NOT NULL or constraints in a later migration. Add indexes with `algorithm: :concurrently` (plus `disable_ddl_transaction!`). The `strong_migrations` gem catches unsafe migrations.
</details>

---

## Security

<details><summary>What is CSRF? How does Rails prevent it?</summary>

Cross-Site Request Forgery: a malicious site makes a logged-in user's browser send a request to your app. Rails embeds an **authenticity token** in forms and meta tags (`protect_from_forgery`) and rejects non-GET requests without a valid token. SameSite cookies help as well. That's also why GET requests must never change data.
</details>

<details><summary>How do you prevent SQL injection in Rails?</summary>

Never interpolate user input into SQL. Use hash conditions or placeholders: `where(email: params[:email])` or `where("email = ?", params[:email])`. Not `where("email = '#{params[:email]}'")`. Be careful with `order(params[:sort])`: check the value against an allowlist first.
</details>

<details><summary>What is XSS? How does Rails help?</summary>

Cross-site scripting: user input is shown as HTML or JS. Rails **escapes output by default** in ERB. It's dangerous when you use `raw`, `html_safe` or `<%==` on user content; use `sanitize` instead. A Content Security Policy adds another layer.
</details>

**Also asked:** mass assignment (strong params) · storing passwords (bcrypt with `has_secure_password`) · authorization vs authentication (Pundit) · keeping secrets out of git (credentials, ENV) · Brakeman · rate limiting · IDOR (always scope lookups: `current_user.orders.find(id)`)

---

## Testing

<details><summary>What types of tests do you write in Rails?</summary>

Model or unit tests (validations, methods), **request specs** (endpoints: status codes and JSON), system or feature tests (the browser with Capybara, only for the most important flows), job and mailer specs. Follow the testing pyramid: many fast unit tests and few slow end-to-end tests.
</details>

<details><summary>What's the difference between a mock, a stub and a double?</summary>

A **double** is a fake object. A **stub** returns canned answers (`allow(api).to receive(:fetch).and_return(data)`). A **mock** also **checks that a call happened** (`expect(mailer).to receive(:deliver)`). Stub external services; don't mock the code you're testing.
</details>

<details><summary>FactoryBot or fixtures?</summary>

Fixtures (YAML) load once and are fast, and they're Rails' default. Factories build data per test, which is flexible and readable but slower; use `build` / `build_stubbed` instead of `create` where you can.
</details>

**Also asked:** `let` vs `let!` · `before` hooks · `describe` / `context` / `it` · how you test a background job · how you test an external API (WebMock / VCR) · TDD · what you'd test first in a new feature

---

## JavaScript & React

Asked for full-stack roles, or when the team uses React with Rails.

<details><summary>What is a closure?</summary>

A function that remembers the variables from the scope where it was created, even after that scope has finished:
```js
function counter() { let n = 0; return () => ++n; }
const next = counter(); next(); // 1
next(); // 2
```
</details>

<details><summary>Explain the event loop. What does this print?</summary>

```js
console.log(1); setTimeout(() => console.log(2)); Promise.resolve().then(() => console.log(3)); console.log(4);
// 1 4 3 2: synchronous code first, then microtasks (promises), then macrotasks (timers)
```
</details>

<details><summary>What's the difference between <code>var</code>, <code>let</code> and <code>const</code>?</summary>

`var` is function-scoped and hoisted with the value `undefined`. `let` and `const` are block-scoped and stay in the temporal dead zone until declared. `const` can't be reassigned, but the object it points to can still change.
</details>

<details><summary>What's the difference between <code>==</code> and <code>===</code>? What is <code>this</code>?</summary>

`==` converts types before comparing (`"1" == 1` is true); `===` doesn't. `this` depends on **how a function is called**: the object in a method call, `undefined` or the global object in a plain call, and the bound value with `call`, `apply` or `bind`. Arrow functions take `this` from the surrounding scope.
</details>

<details><summary>What's the difference between <code>useEffect</code>, <code>useMemo</code> and <code>useCallback</code>? Why do keys matter?</summary>

`useEffect` runs side effects after render (data fetching, subscriptions); return a cleanup function. `useMemo` caches a computed **value**, and `useCallback` caches a **function**, between renders while their dependencies don't change. **Keys** let React match list items across renders; use stable IDs, not the array index.
</details>

<details><summary>How do you fetch data from a Rails API in React?</summary>

`useEffect` with `fetch` or axios, tracking `loading` / `error` / `data` state (or TanStack Query, which handles caching). Configure CORS in Rails, send the auth token in a header, and show the validation errors that come back in a 422 response.
</details>

**Also asked:** props vs state · controlled inputs · lifting state up · Context vs Redux · what causes re-renders · `Promise.all` · debounce and throttle · `map` / `filter` / `reduce` · spread and destructuring · async/await error handling

---

## Git & tools

<details><summary>What's the difference between <code>git merge</code> and <code>git rebase</code>?</summary>

Merge keeps history as it happened and adds a merge commit. Rebase replays your commits on top of another branch for a linear history. **Never rebase commits other people have already pulled.** A common flow is to rebase your feature branch on `main` before opening a PR, and then squash-merge it.
</details>

**Also asked:** resolving conflicts · `git stash` · `cherry-pick` · `reset` (soft, mixed, hard) vs `revert` · your branching strategy (GitHub Flow / Git Flow) · what you look for when reviewing code · Docker basics · CI pipelines · Scrum ceremonies

---

## System design (mid)

Usually light at this level: "design the models and endpoints for X". Answer in this order: requirements → models and associations → endpoints → edge cases → scaling.

- **Design the database for an e-commerce store** (users, products, orders, order_items, payments). Why store `price` on `order_items`?
- **Design a URL shortener:** generating the code, a unique index, the redirect, counting clicks with a background job, caching.
- **Design a notification system:** email, SMS and in-app; preferences; background jobs; retries.
- **Design a booking or appointment system:** preventing double booking (unique constraint or locking), time zones.
- **Bulk CSV import of 100k rows:** a background job, `insert_all` in batches, validation, progress reporting, error reports.
- **Multi-tenant SaaS:** scoping by `account_id`, row-level separation vs one schema per tenant.

---

## Common live-coding tasks

Practise these in Ruby **without looking anything up**. Most are in [problem-solving](../problem-solving/).

- FizzBuzz · reverse a string or words · palindrome · anagram · count characters or words (`tally`)
- Find duplicates · the missing number · the second largest number · two sum · flatten a nested array
- Balanced parentheses · first non-repeating character · group anagrams · merge intervals
- Fibonacci and factorial (recursive and iterative) · prime check · sorting algorithms
- **Rails specific:** "add a model with these associations and validations", "write a scope", "fix this N+1", "write a migration", "build a CRUD endpoint with tests"
- **SQL:** write the queries in the [SQL section](#sql) by hand

---

## Behavioural & HR

Prepare short, specific answers. For stories, use **STAR**: Situation → Task → Action → Result.

- **Tell me about yourself.** 60–90 seconds: current role, years of experience, main stack, one achievement, why this role.
- **Why are you leaving your current job?** Stay positive and talk about growth; never criticise your current employer.
- **Why haven't you worked with Rails recently?** Be honest, and show you've caught up. See [README](README.md#if-youve-been-away-from-rails-for-a-while).
- **Walk me through your best project.** Architecture, your role, a hard problem you solved.
- **Tell me about a difficult bug.** How you debugged it, not just what the fix was.
- **Tell me about a time you missed a deadline or made a mistake.** Take responsibility, then explain what you changed.
- **Tell me about a disagreement with a teammate or lead.**
- **How do you estimate a task? What do you do when requirements are unclear?**
- **Have you worked with foreign clients?** How did you communicate (standups, Slack, demos)?
- **How do you keep learning?**
- **Where do you see yourself in 2–3 years?**
- **What's your current and expected salary? What's your notice period?** See [README](README.md#salary-and-level).
- **Are you comfortable with night shifts or US hours? Remote, hybrid or on-site?**

---

## Questions to ask them

- What does the team look like (size, seniority), and who would I work with most?
- What's the stack: Rails version, frontend, database, background jobs, hosting?
- Is it a product company or client work? Will I talk to clients directly?
- How are code reviews, testing and deployments done?
- What would a successful first three months look like in this role?
- How are performance reviews and increments handled? Is there a path from junior to mid level?
