# Use an official Python runtime as a parent image
FROM python:3.13

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
ENV FLASK_ENV=production

# MySQL environment variables
#ENV DB_USERNAME="flaskapp_user"
#ENV DB_PASSWORD="flaskapp_password"
#ENV DB_NAME="flaskapp_db"
#ENV DB_HOST="10.40.20.123:3306"

#Expose the port on which the app will run
EXPOSE 80

# Run the application using Gunicorn WSGI server
#CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:80", "crudapp:app"]
COPY entrypoint.sh app/entrypoint.sh
RUN chmod +x app/entrypoint.sh

ENTRYPOINT ["app/entrypoint.sh"]

