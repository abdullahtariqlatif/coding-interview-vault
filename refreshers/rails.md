# Rails refresher: what's new in 7.x and 8.x

Check the latest with `gem list rails` / `rails -v`, and the [official release notes](https://guides.rubyonrails.org/).

## Rails 7.0 – 7.2
- **Hotwire by default**: Turbo (Drive, Frames, Streams) + Stimulus; no Webpacker.
- **Import maps** by default; `jsbundling-rails` / `cssbundling-rails` for esbuild, Bun, Tailwind and so on.
- **Encrypted attributes**: `encrypts :ssn`.
- **`load_async`** for parallel queries; Zeitwerk is the only autoloader.
- **7.1**: generated `Dockerfile`, `normalizes :email, with: -> { it.strip.downcase }`, `generates_token_for`, `authenticate_by`, composite primary keys, `Rails.application.deprecators`.
- **7.2**: dev containers, a default GitHub CI workflow with RuboCop and Brakeman, YJIT on by default, PWA manifest files, `allow_browser` version guard.

## Rails 8.0
- **The Solid trio** (database-backed, so no Redis is needed): **Solid Queue** (jobs), **Solid Cache**, **Solid Cable**.
- **Authentication generator**: `bin/rails generate authentication` (sessions, password reset, `has_secure_password`).
- **Propshaft** is the default asset pipeline instead of Sprockets.
- **Kamal 2 + Thruster** for deployment out of the box.
- **`params.expect(user: [:name, :email])`**: safer strong params than `require(...).permit(...)`.
- SQLite is treated as production ready.

## Rails 8.1
- **Active Job continuations**: long jobs can resume from a checkpoint after a restart.
- **Structured event reporting**: `Rails.event.notify(...)`.
- **Local CI**: `config/ci.rb` + `bin/ci`.
- Markdown rendering support and deprecated associations (`has_many :x, deprecated: true`).

## Core topics interviewers still ask about
- **N+1**: `includes` vs `preload` vs `eager_load` vs `joins`; the `bullet` gem; `strict_loading`
- **Indexes**: when to add them, composite and unique indexes, `EXPLAIN`
- **Callbacks vs service objects / form objects**, and fat models vs concerns
- **Associations**: `has_many :through` vs HABTM, polymorphic associations, STI
- **Transactions and locking**: `transaction`, `lock!`, optimistic locking (`lock_version`)
- **Jobs**: idempotency, retries, `perform_later` vs `perform_now`
- **Caching**: fragment and Russian-doll caching, `Rails.cache.fetch`, cache keys
- **Security**: CSRF tokens, SQL injection (`where("x = ?", v)`), XSS escaping, strong params
- **Request lifecycle**: Rack middleware → router → controller → view
- **Testing**: model, request and system specs; factories vs fixtures
- **API mode**: `--api`, serialization (Jbuilder, `as_json`, Alba), versioning, pagination, CORS
