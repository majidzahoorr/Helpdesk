#!/bin/bash
# script.sh


# Wait for Postgres to be ready
while ! nc -z "$POSTGRES_HOST" "$POSTGRES_PORT"; do
  echo "Waiting for PostgreSQL at $POSTGRES_HOST:$POSTGRES_PORT..."
  sleep 1
done

# Apply migrations
echo "Applying migrations..."
python manage.py migrate

# Make migrations if needed
echo "Making migrations..."
python manage.py makemigrations
python manage.py tailwind init
export TAILWIND_APP_NAME=theme  # <--- set your custom app name her

python manage.py tailwind install
# Create default superuser
echo "Creating default superuser..."
python manage.py shell <<EOF
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin')
EOF

# Run the Django development server
exec "$@"
