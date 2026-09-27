#!/usr/bin/env bash
#
# Drops the development database, installs the schema, seeds the example data and
# refreshes example-data.sql.
#
# Before 1.0 there are no rename migrations: when the entities change, run this.
#
#   database/reset.sh

set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DIR"

DB=$(sed -n 's/^database.default.name *= *//p' dpress.ini | tr -d ' "')
MYSQL=${MYSQL:-mysql}
MYSQLDUMP=${MYSQLDUMP:-mysqldump}
USER=${DB_USER:-root}

echo "Recreating $DB"
"$MYSQL" -u "$USER" -e "drop database if exists \`$DB\`; create database \`$DB\` character set utf8;"

# The stored paths carry a random suffix, so a reseed writes new files and leaves the previous
# run's behind - still committed, and referenced by nothing. The year folders go with the
# database; .htaccess is ours and stays.
echo "Clearing public/uploads"
find public/uploads -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +

vendor/bin/dpress install
php database/seed.php

echo "Writing database/example-data.sql"
"$MYSQLDUMP" -u "$USER" --default-character-set=utf8 --skip-dump-date --add-drop-table "$DB" > database/example-data.sql
echo "Done."
