FROM python:3.8.3-alpine

ENV HOME="/root" \
    LANG='en_US.UTF-8' \
    LC_ALL='en_US.UTF-8' \
    WORKDIR='/app' \
    PYTHONPATH=${PYTHONPATH}:${WORKDIR}

WORKDIR ${WORKDIR}
COPY . ${WORKDIR}

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev mysql-client \
    && apk add --no-cache mariadb-dev \
    && python -m pip install --upgrade pip \
    && pip install -r ./requirements.txt

USER 1001

#CMD ["mysql", "-h", "mysql", "-u", "root", "-e", "select * from test.test"]
CMD [ \
    "clickhouse-mysql", \
        "--src-server-id=1", \
        "--src-host=mysql", \
        "--src-user=root", \
        "--src-password=", \
        "--src-tables=test.test", \
        "--dst-host=clickhouse", \
        "--dst-user=default", \
        "--dst-password=", \
        "--dst-create-table", \
        "--migrate-table", \
        "--log-level=debug" \
]
