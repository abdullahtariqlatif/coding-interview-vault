# Rails checklist

Everything Rails that comes up in interviews, **including first-year basics that slip away once you stop using them every day**. Items marked **(mid)** usually separate mid-level answers from junior ones.

← Back to [ROADMAP](../ROADMAP.md) · What's new: [refreshers/rails.md](../refreshers/rails.md) · Questions: [interview/questions.md](../interview/questions.md)

---

## 1. Principles and setup
- [ ] What Rails is: a full-stack MVC framework; **Convention over Configuration**, **DRY**, REST, "omakase"
- [ ] MVC: what belongs in models, views and controllers, and why "skinny controller, fat model" is only partly true
- [ ] `rails new` options: `-d postgresql`, `--api`, `-j esbuild`, `-c tailwind`, `-T`, `--skip-*`, `--minimal`
- [ ] Directory structure: `app/` (models, controllers, views, helpers, jobs, mailers, channels, javascript, assets), `config/`, `db/`, `lib/`, `public/`, `test/` or `spec/`, `bin/`, `log/`, `tmp/`, `storage/`, `vendor/`
- [ ] Key files: `Gemfile`, `config/routes.rb`, `config/database.yml`, `config/application.rb`, `config/environments/*.rb`, `config/initializers/`, `config/credentials.yml.enc`, `config/puma.rb`, `config.ru`, `Procfile.dev`, `bin/dev`
- [ ] The three default environments (development, test, production), `Rails.env`, `RAILS_ENV`
- [ ] Naming conventions: singular model `User` ↔ plural table `users`; plural controller `UsersController`; foreign key `user_id`; HABTM join table `roles_users` (alphabetical); file names matching class names

## 2. The Rails command line
- [ ] `rails server`, `rails console` (`--sandbox`, `reload!`, `app.`, `helper.`), `rails runner`, `rails dbconsole`
- [ ] Generators: `model`, `controller`, `scaffold`, `resource`, `migration` (with the `AddXToY` naming magic), `job`, `mailer`, `channel`, `authentication`, `rails destroy`
- [ ] `rails routes` (with `-g`, `-c`, `--expanded`), `rails about`, `rails stats`, `rails notes`, `rails middleware`, `rails initializers`
- [ ] Database tasks: `db:create`, `db:migrate`, `db:rollback STEP=n`, `db:migrate:status`, `db:migrate VERSION=`, `db:migrate:redo`, `db:seed`, `db:setup`, `db:reset`, `db:drop`, `db:prepare`, `db:schema:load`, `db:schema:dump`
- [ ] Custom rake tasks in `lib/tasks/*.rake` (`namespace`, `desc`, `task x: :environment`)
- [ ] `rails credentials:edit` (per environment), `rails secret`, `rails dev:cache`, `rails assets:precompile`, `rails app:update`

## 3. Routing
- [ ] `root`, `get` / `post` / `patch` / `put` / `delete`, `to: "controller#action"`, `as:`
- [ ] **The 7 RESTful actions**: index, show, new, create, edit, update, destroy, with their verbs, paths and helpers (`posts_path`, `new_post_path`, `edit_post_path(post)`, `post_path(post)`)
- [ ] `resources` vs singular `resource` (no `:id`, no index); `only:` / `except:`
- [ ] Nested resources (and why you shouldn't nest more than one level), `shallow: true`
- [ ] `member` vs `collection` routes
- [ ] `namespace` (URL + module + helper prefix) vs `scope` (URL only, or `module:`) vs `scope module:`
- [ ] Dynamic segments, optional segments `(.:format)`, globbing `*path`, `constraints`, `defaults: { format: :json }`
- [ ] Route `concerns`, `direct`, `resolve`, redirects in routes, `mount` for engines (Sidekiq web, ActionCable)
- [ ] `_path` vs `_url` helpers, `url_for`, `polymorphic_path`, `to_param` for pretty URLs
- [ ] PUT vs PATCH in Rails; how forms send PATCH and DELETE (hidden `_method` field)

## 4. Controllers
- [ ] `ApplicationController`, `ActionController::Base` vs `ActionController::API`
- [ ] Actions, **implicit rendering**, instance variables passed to views
- [ ] `params`: path, query and body params merged; `ActionController::Parameters`; `params[:id]` vs `params.fetch`
- [ ] **Strong parameters**: `require` / `permit`, nested and array params (`tag_ids: []`), `params.expect` (Rails 8), mass assignment
- [ ] Filters: `before_action`, `after_action`, `around_action`, `skip_before_action`, `only:` / `except:`, `prepend_before_action`; halting by rendering or redirecting
- [ ] `render` options: `:template`, `:partial`, `:json`, `:plain`, `:html`, `:status`, `:layout`, `:locals`; `head :no_content`
- [ ] `redirect_to` (with `notice:` / `alert:`, `status: :see_other` for Turbo), `redirect_back(fallback_location:)`
- [ ] **`render` vs `redirect_to`**, and the `DoubleRenderError` (use `and return`)
- [ ] `respond_to do |format|` for HTML, JSON and Turbo Stream
- [ ] `session`, `cookies` (signed, encrypted, permanent), `reset_session`
- [ ] `flash` vs `flash.now` vs `flash.keep`
- [ ] `rescue_from`, custom 404 and 500 handling, `ActiveRecord::RecordNotFound` → 404
- [ ] `helper_method`, the `request` and `response` objects (headers, `remote_ip`, `format`, `xhr?`)
- [ ] `send_file`, `send_data`, streaming, `ActionController::Live` **(mid)**
- [ ] Rate limiting with `rate_limit` (Rails 8) **(mid)**
- [ ] Concerns in controllers

## 5. Views
- [ ] ERB tags: `<% %>`, `<%= %>`, `<%# %>`, `<%==` / `raw` / `html_safe` (and the XSS risk)
- [ ] Layouts, `yield`, `content_for` / `yield :name`, `provide`, choosing a layout per controller or action
- [ ] Partials: `render "form"`, `locals:`, **collection rendering** (`render @posts`), `_post.html.erb`, `as:`, `object:`, `post_counter`, `spacer_template`, strict locals **(mid)**
- [ ] Helpers: `link_to`, `button_to` (vs `link_to` with a method), `image_tag`, `url_for`, `number_to_currency`, `number_with_delimiter`, `time_ago_in_words`, `truncate`, `pluralize`, `simple_format`, `sanitize`, `dom_id`, `tag.div`, `content_tag`, `cycle`
- [ ] Custom helpers in `app/helpers`
- [ ] Forms: `form_with model:` vs `form_with url:`, form builder fields (`text_field`, `text_area`, `select`, `collection_select`, `check_box`, `radio_button`, `file_field`, `date_field`), `fields_for`, `label`, `submit`, showing `errors.full_messages`
- [ ] Nested forms with `accepts_nested_attributes_for`
- [ ] The old `form_for` / `form_tag` (you'll see them in legacy code)
- [ ] I18n in views: `t(".title")` (lazy lookup), `l(date)`
- [ ] Templating alternatives: HAML, Slim; ViewComponent, Phlex **(mid)**
- [ ] Jbuilder for JSON views

## 6. Active Record basics
- [ ] What an ORM is; Active Record pattern vs Data Mapper
- [ ] CRUD: `new` + `save`, `create`, `find`, `find_by`, `where`, `all`, `first`, `last`, `take`, `update`, `destroy`
- [ ] `save` vs `save!`, `create` vs `create!`; `new_record?`, `persisted?`, `destroyed?`
- [ ] **`update` vs `update_attribute` vs `update_column(s)` vs `update_all`**: which run validations and callbacks
- [ ] **`destroy` vs `delete`**, `destroy_all` vs `delete_all`
- [ ] Dirty tracking: `changed?`, `changes`, `name_changed?`, `name_was`, `saved_change_to_name?`, `previous_changes`, `will_save_change_to_*` **(mid)**
- [ ] `reload`, `touch`, `increment!`, `decrement!`, `toggle!`
- [ ] Timestamps, `id` / primary keys, UUID primary keys
- [ ] **Enums**: `enum :status, { draft: 0, published: 1 }`, generated methods and scopes, integer vs string columns
- [ ] Attributes API (`attribute :price, :decimal`), `serialize`, `store` / `store_accessor`, JSON columns
- [ ] `normalizes` (7.1), `encrypts` (7.0)
- [ ] `ActiveModel::Model` for non-database models, and `ActiveModel::Attributes`

## 7. Migrations and schema
- [ ] `create_table`, `add_column`, `remove_column` (give the type so it can be reversed), `rename_column`, `change_column` (can't be reversed automatically), `change_column_null`, `change_column_default`
- [ ] `add_reference` / `t.references` (with `foreign_key: true`, `index`), `add_foreign_key`, `add_index` (unique, composite), `t.timestamps`
- [ ] Column types: string vs text, integer vs bigint, **decimal vs float for money** (`precision`, `scale`), boolean, date / datetime / time, json / jsonb, uuid; the `null:`, `default:` and `limit:` options
- [ ] `change` vs `up` / `down` vs `reversible`; irreversible migrations
- [ ] Migration timestamps (versions), the `schema_migrations` table
- [ ] `schema.rb` vs `structure.sql`; why you never edit a migration that has already run in shared environments
- [ ] `db/seeds.rb`, idempotent seeds (`find_or_create_by!`)
- [ ] Data migrations vs schema migrations; zero-downtime migrations (`strong_migrations`) **(mid)**

## 8. Validations
- [ ] Built-in: `presence`, `absence`, `uniqueness` (with `scope:` and `case_sensitive:`), `length`, `format`, `numericality`, `inclusion` / `exclusion`, `acceptance`, `confirmation`, `comparison`
- [ ] `validates_associated`, `belongs_to` presence (required by default since Rails 5; use `optional: true` to turn it off)
- [ ] Custom validation methods (`validate :check_x`), custom validator classes (`EachValidator`)
- [ ] Conditional validations: `if:`, `unless:`, `on: :create`, custom contexts
- [ ] `allow_nil` vs `allow_blank`
- [ ] The `errors` object: `errors.add`, `errors[:name]`, `full_messages`, `errors.details`
- [ ] `valid?` / `invalid?`; **which methods skip validations** (`save(validate: false)`, `update_column(s)`, `update_all`, `insert_all`, `toggle!`, `increment!`)
- [ ] Why a uniqueness validation needs a **unique database index** as well

## 9. Callbacks
- [ ] The full order on create, update and destroy (`before_validation` → … → `after_commit`)
- [ ] `before_save` vs `before_create`, `around_*`, `after_initialize`, `after_find`, `after_touch`
- [ ] **`after_save` vs `after_commit`** (and `after_create_commit`, `after_update_commit`, `after_rollback`)
- [ ] Stopping the chain with `throw(:abort)`
- [ ] Conditional callbacks; which methods skip callbacks
- [ ] Why callbacks can turn into a mess, and the alternatives (service objects) **(mid)**

## 10. Associations
- [ ] `belongs_to`, `has_one`, `has_many`, `has_many :through`, `has_one :through`, `has_and_belongs_to_many`
- [ ] Choosing between `has_many :through` and HABTM
- [ ] Polymorphic associations (`commentable_type` / `commentable_id`), `delegated_type` **(mid)**
- [ ] Self-referential associations: manager/employees, followers/following (with `class_name`, `foreign_key`, `source`)
- [ ] Options: `class_name`, `foreign_key`, `primary_key`, `dependent` (`:destroy`, `:delete_all`, `:nullify`, `:restrict_with_error`, `:restrict_with_exception`), `inverse_of`, `counter_cache`, `touch`, `source`, `as`, `through`, `optional`, `autosave`, `validate`, scope lambdas
- [ ] Generated methods: `post.comments.build` / `create` / `<<` / `delete` / `clear`, `comment_ids`, `build_profile`, `create_profile`, `reload_author`
- [ ] `accepts_nested_attributes_for` (`allow_destroy`, `reject_if`)
- [ ] `delegate :name, to: :user, prefix: true, allow_nil: true`
- [ ] Single Table Inheritance (`type` column), and when not to use it

## 11. Querying
- [ ] `where` with a hash, an array (`"x > ?"`), named placeholders, ranges, arrays (IN), `nil` (IS NULL); `where.not`, `or`, `and`
- [ ] `where.missing(:assoc)` and `where.associated(:assoc)`
- [ ] `order`, `reorder`, `limit`, `offset`, `select`, `distinct`, `group`, `having`, `joins`, `left_joins` / `left_outer_joins`
- [ ] **`includes` vs `preload` vs `eager_load` vs `joins`**, and `references`
- [ ] `pluck`, `pick`, `ids`; **`pluck` vs `select` vs `map`**
- [ ] **`count` vs `size` vs `length`** on relations and associations
- [ ] **`exists?` vs `any?` vs `present?`**
- [ ] Calculations: `sum`, `average`, `minimum`, `maximum`, `count` with `group`
- [ ] `find_or_create_by`, `find_or_initialize_by`, `create_or_find_by`, and the race conditions they have **(mid)**
- [ ] Batches: `find_each`, `find_in_batches`, `in_batches`
- [ ] Bulk operations: `insert_all`, `upsert_all`, `update_all`, `delete_all`, `touch_all` (no validations or callbacks)
- [ ] Relations are **lazy**: when the query actually runs (`to_a`, `each`, `load`, `inspect` in the console)
- [ ] Scopes, chaining, `merge`, `unscope`, `rewhere`, `none`, `extending`
- [ ] Why `default_scope` causes problems
- [ ] Raw SQL: `find_by_sql`, `connection.execute`, `select_all`, `sanitize_sql_array`, `Arel.sql`; `to_sql`, `explain`
- [ ] Arel basics **(mid)**
- [ ] `lock`, `with_lock`, optimistic locking (`lock_version`) **(mid)**
- [ ] `load_async` **(mid)**
- [ ] Multiple databases, read replicas (`connects_to`, `connected_to(role: :reading)`) **(mid)**

## 12. Active Support
- [ ] `blank?`, `present?`, `presence`, `try`, `in?`
- [ ] Time: `Time.current` vs `Time.now`, `Time.zone`, `Date.current`, `3.days.ago`, `1.week.from_now`, `beginning_of_day`, `end_of_month`, `config.time_zone` and UTC storage
- [ ] Inflections: `pluralize`, `singularize`, `camelize`, `underscore`, `titleize`, `humanize`, `parameterize`, `constantize`, `classify`, `tableize`
- [ ] String and array helpers: `squish`, `truncate`, `to_sentence`, `in_groups_of`, `second`, `excluding`, `index_by`, `index_with`, `many?`, `sum`
- [ ] Hash helpers: `slice`, `except`, `deep_merge`, `symbolize_keys`, `with_indifferent_access`, `reverse_merge`
- [ ] `ActiveSupport::Concern`, `class_attribute`, `mattr_accessor` / `cattr_accessor`, `delegate`, `with_options`
- [ ] `Current` attributes (`ActiveSupport::CurrentAttributes`) **(mid)**
- [ ] `ActiveSupport::Notifications` (instrumentation), `Rails.cache`, `Rails.logger` **(mid)**

## 13. Front end in Rails
- [ ] How assets evolved: Sprockets → Webpacker (retired) → import maps, `jsbundling-rails` and `cssbundling-rails` → Propshaft (Rails 8)
- [ ] Import maps (`bin/importmap pin`), `rails assets:precompile`, asset fingerprinting
- [ ] The old Rails UJS: `remote: true`, `data-method`, `data-confirm` (removed; Turbo replaced it)
- [ ] **Turbo Drive**: link and form interception, `data-turbo="false"`, `data-turbo-method`, `data-turbo-confirm`, returning a **422 status** for invalid forms and **303** for redirects
- [ ] **Turbo Frames**: `turbo_frame_tag`, lazy-loaded frames (`src`, `loading: :lazy`), `target: "_top"`
- [ ] **Turbo Streams**: the actions (`append`, `prepend`, `replace`, `update`, `remove`, `before`, `after`, `refresh`), `format.turbo_stream`, `*.turbo_stream.erb`, broadcasting from models (`broadcasts_to`, `broadcast_append_to`)
- [ ] Turbo 8 page refreshes with morphing **(mid)**
- [ ] **Stimulus**: controllers, `data-controller`, `data-action`, targets, values, classes, outlets, the `connect` / `disconnect` lifecycle
- [ ] Using React or Vue with Rails: an API plus a separate SPA, jsbundling, `vite_rails`, Inertia.js

## 14. Authentication and authorization
- [ ] Sessions and cookies; how a login session works in Rails
- [ ] `has_secure_password` (bcrypt, `password_digest`, `authenticate`), `authenticate_by` (7.1)
- [ ] The Rails 8 authentication generator (what it creates)
- [ ] Devise: modules (`database_authenticatable`, `registerable`, `recoverable`, `rememberable`, `confirmable`, `lockable`, `trackable`, `omniauthable`), `authenticate_user!`, `current_user`, `user_signed_in?`, customising controllers and views, strong params for sign-up
- [ ] Password reset tokens, `generates_token_for`, `signed_id`
- [ ] OAuth / OmniAuth (Google or GitHub sign-in)
- [ ] API authentication: tokens, JWT, Devise JWT, `authenticate_with_http_token`
- [ ] Authorization: Pundit (policies, `authorize`, `policy_scope`, `verify_authorized`), CanCanCan (`Ability`, `can?`, `load_and_authorize_resource`), roles with an enum or rolify

## 15. Mailers
- [ ] Generating a mailer, mailer views, layouts, `default from:`
- [ ] `deliver_now` vs `deliver_later`; parameterized mailers (`with(user:)`)
- [ ] Previews (`/rails/mailers`), letter_opener in development
- [ ] SMTP setup, `default_url_options`, attachments, inline images
- [ ] Action Mailbox (incoming email) **(mid)**

## 16. Background jobs
- [ ] Why use background jobs; Active Job as the shared interface
- [ ] Adapters: Sidekiq (Redis), Solid Queue (database, Rails 8 default), GoodJob, Delayed Job, Resque
- [ ] `perform_later` vs `perform_now`, `set(wait: 5.minutes)` / `wait_until:`, queues, priorities
- [ ] GlobalID: why you pass records or IDs, not plain objects
- [ ] `retry_on`, `discard_on`, exponential backoff, dead jobs
- [ ] **Idempotency**, and what happens when a job runs twice
- [ ] Recurring and scheduled jobs: `whenever` (cron), `sidekiq-cron`, Solid Queue `recurring.yml`
- [ ] Sidekiq: workers, concurrency, the web UI, `Sidekiq::Job` vs Active Job **(mid)**
- [ ] Job continuations (Rails 8.1) **(mid)**

## 17. Action Cable (real time)
- [ ] WebSockets vs polling; connections, channels, subscriptions, streams
- [ ] `stream_from` / `stream_for`, broadcasting, authenticating the connection
- [ ] Adapters: async, Redis, Solid Cable; Turbo Streams over Action Cable

## 18. Files, rich text, I18n
- [ ] Active Storage: `has_one_attached`, `has_many_attached`, services (local disk, S3, GCS), direct uploads, variants (`image_processing`), `purge` vs `purge_later`, validating type and size (gem or custom)
- [ ] Older upload gems you may see: CarrierWave, Paperclip (deprecated), Shrine
- [ ] Action Text (Trix rich text editor)
- [ ] I18n: `config/locales/*.yml`, `t`, `l`, interpolation, pluralization, default locale, switching locale per request, model and attribute translations

## 19. Caching and performance **(mid)**
- [ ] **N+1 queries**: finding them (logs, Bullet, `strict_loading`) and fixing them
- [ ] Indexes on foreign keys and filtered columns; `counter_cache`
- [ ] Selecting only the columns you need; `find_each` for large tables; pagination (Pagy, Kaminari, will_paginate)
- [ ] Caching types: page and action caching (removed from core), **fragment**, **Russian doll** (`touch: true`), **low-level** (`Rails.cache.fetch`), the SQL query cache
- [ ] Cache keys and versioning (`cache_key_with_version`), expiring caches
- [ ] Cache stores: memory, file, Redis, Memcached, Solid Cache; `rails dev:cache`
- [ ] HTTP caching: ETags, `fresh_when`, `stale?`, `expires_in`, `Cache-Control`
- [ ] Profiling: rack-mini-profiler, memory_profiler, stackprof, APM (New Relic, Skylight, Scout)
- [ ] Puma workers and threads; database connection pool size

## 20. Security
- [ ] **CSRF** (`protect_from_forgery`, the authenticity token, why GET requests must not change data)
- [ ] **XSS** (escaping by default, `sanitize`, `html_safe`, Content Security Policy)
- [ ] **SQL injection** (placeholders; risky methods such as `order(params[:x])` and `where("... #{x}")`)
- [ ] **Mass assignment** (strong params)
- [ ] Session hijacking and fixation (`reset_session` on login), secure, HttpOnly and SameSite cookies, `force_ssl`
- [ ] IDOR: scope lookups to the current user (`current_user.orders.find`)
- [ ] Open redirects, file upload risks, regex anchors (`\A` / `\z`)
- [ ] Secrets: credentials, ENV, `filter_parameter_logging`
- [ ] CORS for APIs (`rack-cors`)
- [ ] Brakeman, `bundler-audit`, dependency updates

## 21. Configuration, autoloading and Rack
- [ ] `config/application.rb` vs environment files vs initializers, and the boot order
- [ ] `Rails.application.config`, `config_for(:yaml)`, ENV variables, `dotenv`
- [ ] **Zeitwerk** autoloading: file and constant naming rules, `autoload_paths`, `eager_load` in production, why `lib/` needs `autoload_lib`
- [ ] **Rack**: `call(env)` → `[status, headers, body]`, `config.ru`, the middleware stack (`rails middleware`), writing and inserting custom middleware **(mid)**
- [ ] Engines, Railties, mountable engines **(mid)**

## 22. Testing
- [ ] Minitest (the Rails default): `test/` layout, fixtures, assertions (`assert_equal`, `assert_difference`, `assert_redirected_to`, `assert_response`)
- [ ] RSpec: `describe` / `context` / `it`, `let` vs `let!`, `subject`, `before` / `after`, matchers, `expect { }.to change`, shared examples, `rails_helper` vs `spec_helper`
- [ ] Test types: model, request (preferred over controller specs), system (Capybara + a headless browser), mailer, job, helper, routing
- [ ] FactoryBot: `build` vs `create` vs `build_stubbed`, traits, sequences, associations; fixtures vs factories
- [ ] Faker, shoulda-matchers, DatabaseCleaner vs transactional tests
- [ ] Stubbing and mocking: `allow`, `expect(...).to receive`, `instance_double`, WebMock, VCR
- [ ] Time helpers: `travel_to`, `freeze_time`
- [ ] Testing jobs (`have_enqueued_job`, `perform_enqueued_jobs`) and mailers (`ActionMailer::Base.deliveries`)
- [ ] SimpleCov, parallel tests, CI **(mid)**

## 23. Debugging
- [ ] Reading the development log (SQL, params, render times) and stack traces
- [ ] `debug` gem (`debugger`, `binding.irb`), pry, byebug; `web-console`
- [ ] `rails console --sandbox`, `to_sql`, `explain`
- [ ] `Rails.logger.debug`, log levels, tagged logging

## 24. Building APIs
- [ ] `--api` mode and what it leaves out
- [ ] Serialization: `render json:`, `as_json`, Jbuilder, ActiveModelSerializers (legacy), jsonapi-serializer, Alba / Blueprinter
- [ ] Status codes, consistent error format, `rescue_from` in a base API controller
- [ ] Versioning (`namespace :api { namespace :v1 }`), pagination metadata, filtering and sorting (Ransack)
- [ ] Token or JWT auth, CORS, rate limiting (Rack::Attack, `rate_limit`)
- [ ] Documentation: rswag / OpenAPI **(mid)**
- [ ] Consuming APIs: Faraday, HTTParty, Net::HTTP, timeouts, retries, webhooks with signature verification **(mid)**
- [ ] GraphQL with graphql-ruby: basics only **(mid)**

## 25. Deployment and operations
- [ ] App servers (Puma) vs web servers (Nginx as a reverse proxy)
- [ ] What a production deploy involves: `RAILS_ENV=production`, `RAILS_MASTER_KEY`, `assets:precompile`, `db:migrate`, restarting the app
- [ ] Platforms: Heroku, Render, Fly.io; Capistrano (VPS); Docker + Kamal 2 + Thruster (Rails 8)
- [ ] Logs, error tracking (Sentry, Honeybadger, Rollbar), uptime and APM monitoring
- [ ] Zero-downtime deploys and safe migrations **(mid)**
- [ ] Upgrading Rails: `rails app:update`, fixing deprecations, upgrading one minor version at a time, dual booting **(mid)**

## 26. Architecture and patterns **(mid)**
- [ ] Service objects, form objects, query objects, presenters and decorators (Draper), policy objects, value objects
- [ ] Concerns: when they help and when they hide complexity
- [ ] Fat model vs service layer; where business logic should live
- [ ] State machines (AASM)
- [ ] Soft deletes (discard, paranoia), auditing (paper_trail, audited)
- [ ] Multi-tenancy (`acts_as_tenant`, the apartment gem), scoping by account
- [ ] Search: `pg_search`, Ransack, Elasticsearch / Searchkick
- [ ] CSV import and export, PDF generation (Prawn, wicked_pdf), payments (Stripe) and webhooks

## 27. Gems you should be able to name and explain
devise · pundit / cancancan · sidekiq · rspec-rails · factory_bot_rails · faker · shoulda-matchers · debug / pry · rubocop-rails · bullet · pagy / kaminari · ransack · friendly_id · paper_trail · aasm · rack-cors · jwt · faraday / httparty · letter_opener · annotate · strong_migrations · pg_search · money-rails · discard · view_component · image_processing · dotenv-rails · brakeman

## 28. How Rails has changed (for "what's changed since you last used it?" questions)
- [ ] **Rails 4**: strong params, Turbolinks, concerns
- [ ] **Rails 5**: API mode, `ApplicationRecord`, Action Cable, `belongs_to` required by default, `rails` replaces `rake` for commands
- [ ] **Rails 6**: Zeitwerk, multiple databases, Action Mailbox, Action Text, Webpacker by default, parallel testing
- [ ] **Rails 7**: Hotwire, import maps, encrypted attributes, `load_async`; 7.1: Dockerfile, `normalizes`; 7.2: dev containers, YJIT default
- [ ] **Rails 8**: Solid Queue / Cache / Cable, the authentication generator, Propshaft, Kamal 2, `params.expect`; 8.1: job continuations, `Rails.event`, local CI ([refreshers/rails.md](../refreshers/rails.md))
