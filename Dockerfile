FROM python:3.8

LABEL maintainer "ruochi zhang"

ENV HOME /
WORKDIR $HOME
COPY . $HOME

RUN pip install --upgrade pip && \
pip install mlflow[extras] && \
pip install -r requirements.txt
    
EXPOSE 5000

CMD mlflow server \
    --backend-store-uri postgresql://zhangruochi@silexon:Zhang3li4zrc1230@silexon.postgres.database.azure.com:5432/copper \
    --default-artifact-root wasbs://copper@comr2.blob.core.windows.net/models \
    --host 0.0.0.0

