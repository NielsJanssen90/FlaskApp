# Use an official Python runtime as a parent image
FROM python:3.13-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any system dependencies (if necessary)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install pip and virtualenv
RUN pip install --upgrade pip

# Install the Python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Set environment variables for Flask
ENV FLASK_APP=crudapp.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development

# Initialize and run database migrations
RUN flask db init && flask db migrate -m "entries table" && flask db upgrade

# Expose the port on which the app will run
EXPOSE 80

# Run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]
