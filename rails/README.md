# Rails

Two practice projects that cover both ways Rails is used today:

| Project | Type | Front end | What it practises |
|---|---|---|---|
| `hotwire_app/` _(not created yet)_ | Full-stack Rails | ERB views + Hotwire (Turbo Drive, Turbo Frames, Turbo Streams, Stimulus) | Classic Rails MVC, forms, partials, real-time updates without writing a JS framework |
| `api_app/` _(not created yet)_ | API-only Rails (`--api`) | React app in [`../react`](../react/) | JSON APIs, token auth, serializers, CORS, versioning |

The names are suggestions; rename them to match what you build (for example `blog`, `blog_api`).

## Creating the apps

Run these from inside this folder, and **always pass `--skip-git`**:

```bash
cd rails

# 1. Full-stack Hotwire app
rails new hotwire_app --skip-git -d postgresql -c tailwind

# 2. API-only app for the React frontend
rails new api_app --api --skip-git -d postgresql
```

**Why `--skip-git`?** By default `rails new` runs `git init` and creates a nested repository. This repo would then see the app as an empty embedded repo instead of tracking its files. With `--skip-git` the app is tracked here like any other folder.

Each app still gets its own `.gitignore` (Rails generates one either way), and git applies it together with the root `.gitignore`.

## Feature checklists

### 1. Hotwire app
- [ ] Models with associations, validations, scopes and enums (e.g. projects → tasks → comments)
- [ ] Authentication with the Rails 8 generator (`bin/rails generate authentication`)
- [ ] CRUD with `form_with`, partials, layouts, flash messages, validation errors (422 status)
- [ ] **Turbo Drive**: navigation without page reloads, `data-turbo-confirm`, `data-turbo-method`
- [ ] **Turbo Frames**: inline editing, lazy-loaded frames, tabs or modals
- [ ] **Turbo Streams**: create, update and delete without reloading (`format.turbo_stream`)
- [ ] **Broadcasting**: live updates for other users (`broadcasts_to`, Action Cable / Solid Cable)
- [ ] **Stimulus**: controllers with targets, values and actions (toggle, character counter, autocomplete, dropdown)
- [ ] Turbo 8 morphing page refreshes
- [ ] Background job (Solid Queue) + mailer (`deliver_later`)
- [ ] Active Storage upload with an image variant
- [ ] Pagination, search and filtering
- [ ] Authorization (Pundit) and N+1-free pages (`includes`, Bullet)
- [ ] Model, request and system tests

### 2. API-only app
- [ ] Models, migrations with indexes and foreign keys, seeds
- [ ] Namespaced, versioned routes (`/api/v1/...`)
- [ ] JSON CRUD endpoints with correct status codes
- [ ] A base API controller with `rescue_from` and a consistent error format
- [ ] Serializers (Jbuilder, Alba or `as_json`)
- [ ] Token or JWT authentication; current user
- [ ] Authorization (Pundit), scoping records to the current user
- [ ] CORS (`rack-cors`) for the React dev server
- [ ] Pagination metadata, filtering, sorting
- [ ] Rate limiting (`rate_limit`)
- [ ] Background job calling a third-party API with retries
- [ ] Request specs for every endpoint
