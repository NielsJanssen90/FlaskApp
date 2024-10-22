FROM python:3.13-slim


WORKDIR /app


COPY . /app


RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt


ENV FLASK_APP=crudapp.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development


RUN flask db init && flask db migrate -m "entries table" && flask db upgrade


EXPOSE 80


CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]
