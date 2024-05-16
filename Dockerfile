FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y python3.6 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt

EXPOSE 8000

RUN python3 manage.py makemigrations && python3 manage.py migrate


CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
