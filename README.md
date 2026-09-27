# Dynart Documentation

The Dynart documentation, served by [dpress](https://github.com/goph-R/dynart-dpress) and its Docs
plugin in place of the Sphinx build at docs.dynart.net: a thin shell holding the configuration, the
themes, the uploads and the front controller. Started as a copy of the gopherlab.net site. The
design is the `dynart-docs` theme - gopherlab's layout in the docs site's colours - documented in
[themes/dynart-docs/README.md](themes/dynart-docs/README.md).

## Setting one up

```bash
composer install --no-dev -o

vendor/bin/dpress init -base-url https://example.com -db-name mysite -db-user mysite                        -db-password 'from your database' -site-name "My Site"
```

`init` writes the `dpress.ini` and **generates `jwt.secret`** for you, which is the value that
signs every session here and the one it used to be possible to leave as the words "change me".
`app.root_path` comes from the directory you run it in, and it makes `logs/` while it is there.
It will not overwrite a `dpress.ini` that already exists.

Add **`-dev`** for a development site: it turns on error detail, turns off the secure-cookie flag
so a plain HTTP site can log in at all, and points the mailer at `logs/` instead of sending.

The database itself is the one thing it does not do:

```sql
create database `mysite` character set utf8mb4 collate utf8mb4_unicode_ci;
```

**`dpress.ini` is not in git**, on purpose: it holds a password and a secret, and the only copy
that matters is the one on the machine it belongs to. There is no example of it here any more —
`dpress init` writes it from the template inside the dpress package, so there is one shape of the
file rather than two that drift apart.

Then create the schema and somebody to log in as:

```bash
vendor/bin/dpress install
vendor/bin/dpress user:create -email you@example.com -name "Your Name" -role admin
vendor/bin/dpress doctor
```

Leaving `-password` off generates one and prints it, so it never reaches your shell history.
`doctor` is the last step because it is the one that says whether the rest worked.

## Serving it

The document root is **`public/`**, never this folder — `dpress.ini`, `logs/` and `database/`
sit here, and they are all readable over HTTP if the docroot is one level too high.

Apache needs `AllowOverride All` (the routing is in `public/.htaccess`), plus `mod_rewrite` and
`mod_headers`. `logs/` and `public/uploads/` have to be writable by the web user.

`vendor/bin/dpress install` writes `public/uploads/.htaccess` itself, which is what keeps an
uploaded file from ever being executed. Its first line is `php_flag engine off`, a mod_php
directive: under PHP-FPM Apache does not know it and every request into `uploads/` becomes a
500. On FPM, delete that line — the `<FilesMatch>` rule below it already denies `.php` outright.

## Updating

```bash
git pull
composer update --no-dev
vendor/bin/dpress upgrade      # applies whatever migrations are new
vendor/bin/dpress doctor       # says whether anything needs attention afterwards
```

## Development

The dev site runs against `dpress_dev` with `app.environment = dev`, `mail.mailer = log` and a
throwaway JWT secret. The example content and the database reset script are documented in
[database/README.md](database/README.md).
