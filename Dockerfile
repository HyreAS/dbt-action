ARG DBT_VERSION=1.0.0
FROM fishtownanalytics/dbt:${DBT_VERSION}
RUN apt-get update && apt-get install -y libsasl2-dev

# Need to re-declare the ARG to use its default value defined before the FROM
ARG DBT_VERSION
RUN pip install --no-cache-dir --upgrade pip && \
    pip install dbt-spark[PyHive]==${DBT_VERSION} && \
    pip install awscli

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
