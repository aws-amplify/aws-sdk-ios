from datetime import datetime


def log(message):
    print(str(datetime.now()) + f': {message}')
