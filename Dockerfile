FROM python:3.13-slim

# Set up a new user with UID 1000 to be compatible with Hugging Face Spaces
RUN useradd -m -u 1000 user

WORKDIR /home/user/app

# Install dependencies as root
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY --chown=user . .

# Create a writable data directory for SQLite database
RUN mkdir -p /home/user/app/data && chown -R user:user /home/user/app/data

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DATABASE_PATH=/home/user/app/data/db.sqlite3

# Switch to non-root user
USER user

# Run database migrations and collect static files
RUN python manage.py migrate --noinput
RUN python manage.py collectstatic --noinput

EXPOSE 7860

CMD ["uvicorn", "TodoListProject.asgi:application", "--host", "0.0.0.0", "--port", "7860"]
