FROM python:3.10

WORKDIR /app

# Instalar netcat para esperar a MySQL
RUN apt-get update && apt-get install -y netcat-openbsd

# Instalar dependencias Python
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copiar la aplicación y el script de espera
COPY . .
COPY wait-for-db.sh /wait-for-db.sh
RUN chmod +x /wait-for-db.sh

# El entrypoint ahora incluye el script con argumentos dinámicos
ENTRYPOINT ["/wait-for-db.sh", "db", "3306", "--"]

# El CMD se pasa como argumento a wait-for-db.sh
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

