# Rails

Rails practice projects. Each app sits in its own folder here.

## Creating a new app

Run this from inside this folder, and **always pass `--skip-git`**:

```bash
cd rails
rails new <app_name> --api --skip-git -d postgresql   # API-only backend for the React app
# or a full-stack app with Hotwire:
rails new <app_name> --skip-git -d postgresql
```

**Why `--skip-git`?** By default `rails new` runs `git init` and creates a nested repository. This repo would then see the app as an empty embedded repo instead of tracking its files. With `--skip-git` the app is tracked here like any other folder.

The app still gets its own `.gitignore` (Rails generates one either way), and git applies it together with the root `.gitignore`.

## Projects

| App | Description |
|---|---|
| _(none yet)_ | |
