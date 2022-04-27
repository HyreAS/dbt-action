FROM python:3.9
ARG DBT_VERSION=1.0.5

RUN apt-get update && apt-get install -y libsasl2-dev
RUN pip install --no-cache-dir --upgrade pip && \
    pip install dbt-core==${DBT_VERSION} && \
    pip install dbt-bigquery && \
    pip install requests && \
    pip install awscli

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
