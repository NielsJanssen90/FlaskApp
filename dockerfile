FROM python:3.13-slim


WORKDIR /app


RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt /app/requirements.txt


RUN pip install --upgrade pip


RUN pip install -r requirements.txt


COPY . /app


ENV FLASK_APP=crudapp.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development


ENV DB_USER="temp-username"
ENV DB_PASS="temp-password"
ENV DB_NAME="dbname"
ENV DB_HOST="rds-endpoint"
ENV DB_PORT="5432"


EXPOSE 80


CMD flask db init && flask db migrate -m "initial migration" && flask db upgrade && flask run --host=0.0.0.0 --port=80FROM python:3.13-slim


WORKDIR /app


RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt /app/requirements.txt


RUN pip install --upgrade pip


RUN pip install -r requirements.txt


COPY . /app


ENV FLASK_APP=crudapp.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development


ENV DB_USER="temp-username"
ENV DB_PASS="temp-password"
ENV DB_NAME="dbname"
ENV DB_HOST="rds-endpoint"
ENV DB_PORT="5432"


EXPOSE 80


CMD flask db init && flask db migrate -m "initial migration" && flask db upgrade && flask run --host=0.0.0.0 --port=80FROM python:3.13-slim


WORKDIR /app


RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt /app/requirements.txt


RUN pip install --upgrade pip


RUN pip install -r requirements.txt


COPY . /app


ENV FLASK_APP=crudapp.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development


ENV DB_USER="temp-username"
ENV DB_PASS="temp-password"
ENV DB_NAME="dbname"
ENV DB_HOST="rds-endpoint"
ENV DB_PORT="5432"


EXPOSE 80


CMD flask db init && flask db migrate -m "initial migration" && flask db upgrade && flask run --host=0.0.0.0 --port=80
