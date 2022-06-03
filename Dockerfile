FROM python:3.8.12-slim-buster

WORKDIR /app

ADD requirements.txt  /app
RUN pip install -r requirements.txt
ADD . .
CMD ["python3", "bot.py"]