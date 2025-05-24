#!/bin/sh

# Primeros argumentos: host y puerto
HOST="$1"
PORT="$2"
shift 2

echo "Waiting for MySQL at $HOST:$PORT..."

# Espera hasta que el puerto esté disponible
while ! nc -z "$HOST" "$PORT"; do
  sleep 1
done

echo "MySQL is up - launching the application..."
exec "$@"

