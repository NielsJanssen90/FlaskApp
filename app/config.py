import os
basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    SECRET_KEY = 'do-or-do-not-there-is-no-try'

    DB_USER = os.getenv('DB_USER', 'your-username')
    DB_PASS = os.getenv('DB_PASS', 'your-password')
    DB_NAME = os.getenv('DB_NAME', 'your-dbname')
    DB_HOST = os.getenv('DB_HOST', 'your-rds-endpoint')
    DB_PORT = os.getenv('DB_PORT', '5432')  # Default PostgreSQL port

    DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or DATABASE_URL
    SQLALCHEMY_TRACK_MODIFICATIONS = False
