---
title: Todo List App
emoji: 🚀
color: blue
sdk: docker
sdk_version: 29.5.3
python_version: 3.13.5
app_file: app.py
pinned: false
---

# TodoListProject

A simple Django todo app.

## Setup

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
py -3 manage.py migrate
```

## Run locally

Django app:
```powershell
py -3 manage.py runserver
```

## Files

- `manage.py` — Django management
- `TodoListProject/` — project settings and ASGI/WGS entrypoints
- `TodoListApp/` — main app models, views, templates
- `app.py` — ASGI wrapper for deployment
- `requirements.txt` — dependencies
- `.gitignore` — ignores virtual env, DB, and temp files

## GitHub

To publish:

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/<username>/<repo>.git
git push -u origin main
```

## Notes

- `db.sqlite3` is ignored because it is local-only.
- For deployment, use `app.py` with an ASGI host or `manage.py` on a Django-ready host.
