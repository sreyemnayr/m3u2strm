FROM python:3.13-alpine

WORKDIR /app

RUN python -m pip install --upgrade pip

COPY . .

RUN pip install -r requirements.txt

ENV CRONTAB_SCHEDULE="*/30 * * * *"
ENV MEDIA_PATH="/media"

RUN ./create_crontab.sh

CMD ["crond", "-f"]
