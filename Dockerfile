FROM python:3.6.15

WORKDIR /app

ADD ./requirements.txt /app

RUN useradd -m -u 1000 bot

USER bot

RUN pip install -r requirements.txt

ADD src/ /app

ENTRYPOINT [ "/usr/local/bin/python" ]
CMD [ "/app/app.py" ]
