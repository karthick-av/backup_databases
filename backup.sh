#!/bin/bash

# Variables
BACKUP_DIR="."
REPO_DIR="."
DATE=$(date +%F)
DATABASES=("users" "details" "qfoods" "devices" "activity" "address" "notifications" "logs")
MYSQL_USER="root"
MYSQL_PASSWORD="Viratkohli@18"

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Dump each database
for DB in "${DATABASES[@]}"
do
    echo "Backing up database: $DB"
    mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DB" > "${BACKUP_DIR}/${DB}_${DATE}.sql"
    if [ $? -eq 0 ]; then
       echo "Backup of $DB completed."
    else
       echo "Error backing up $DB" >&2
    fi
done

# Copy backups to the Git repository
cp "$BACKUP_DIR"/*.sql "$REPO_DIR/"

# Change to the repository directory
cd "$REPO_DIR"

# Add, commit, and push the backup files
git add .
git commit -m "Database backup for $DATE"
git push 

# After a successful push, delete the backup files from the repository directory
rm -f "$REPO_DIR"/*.sql
