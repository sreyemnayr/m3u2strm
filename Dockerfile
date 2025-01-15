FROM python:3.13-alpine

WORKDIR /app

RUN python -m pip install --upgrade pip

COPY . .

RUN apk add --no-cache bash

RUN pip install -r requirements.txt

RUN dos2unix create_crontab.sh || true

RUN chmod +x ./create_crontab.sh

RUN chmod -R +rw /app/logs

RUN ./create_crontab.sh

ENV CRONTAB_SCHEDULE="*/30 * * * *"
ENV MEDIA_PATH="/media"

CMD ["crond", "-f"]
