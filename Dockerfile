FROM python:3.13-slim

# Set up a new user with UID 1000 to be compatible with Hugging Face Spaces
RUN useradd -m -u 1000 user

WORKDIR /home/user/app

# Install dependencies
COPY --chown=user requirements.txt ./
RUN pip install --no-cache-dir --user -r requirements.txt

# Copy the rest of the application files
COPY --chown=user . .

# Set environment variables
ENV PATH="/home/user/.local/bin:${PATH}" \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Switch to non-root user
USER user

# Run database migrations and collect static files
RUN python manage.py migrate --noinput
RUN python manage.py collectstatic --noinput

EXPOSE 7860

CMD ["uvicorn", "TodoListProject.asgi:application", "--host", "0.0.0.0", "--port", "7860"]


