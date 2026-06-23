FROM python:3.10

# Set working directory
WORKDIR /code

# Copy and install requirements
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --r /code/requirements.txt

# Copy the rest of your application code
COPY . .

# Expose the default port Hugging Face looks for
EXPOSE 7860

# Run the server (replace 'myproject' with your actual project folder name)
CMD ["gunicorn", "--bind", "0.0.0.0:7860", "myproject.wsgi:application"]


