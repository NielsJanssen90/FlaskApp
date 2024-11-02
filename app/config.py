import os

# Example config for MySQL using environment variables
#DB_USERNAME = os.getenv('DB_USERNAME')
#DB_PASSWORD = os.getenv('DB_PASSWORD')
#DB_HOST = os.getenv('DB_HOST')
#DB_NAME = os.getenv('DB_NAME')

#SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://{DB_USERNAME}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}"
#SQLALCHEMY_TRACK_MODIFICATIONS = False

#import os

class Config:
    # Example config for MySQL using environment variables
    DB_USERNAME = os.getenv('DB_USERNAME')
    DB_PASSWORD = os.getenv('DB_PASSWORD')
    DB_HOST = os.getenv('DB_HOST')
    DB_NAME = os.getenv('DB_NAME')

    SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://{DB_USERNAME}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
