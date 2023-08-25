FROM python:3.10
ARG DEBIAN_FRONTEND=noninteractive
ARG DEBCONF_NONINTERACTIVE_SEEN=true
WORKDIR /usr/src/app

RUN apt-get -y update
RUN pip install --upgrade pip

COPY requirements.txt ./
RUN pip3 install -r requirements.txt



COPY tests ./tests
COPY main.py ./


EXPOSE 5000

# ENTRYPOINT ["uvicorn", "--port", "5000", "--host", "0.0.0.0", "main:app" ]
CMD uvicorn main:app --reload --host 0.0.0.0 --port 5000