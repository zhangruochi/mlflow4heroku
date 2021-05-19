FROM python:3.8

LABEL maintainer "ruochi zhang"

ENV HOME /
WORKDIR $HOME
COPY . $HOME

RUN pip install --upgrade pip && \
pip install mlflow[extras] && \
pip install -r requirements.txt

CMD mlflow server \
    --backend-store-uri postgresql://<> \
    --default-artifact-root wasbs://<> \
    --host 0.0.0.0 \
    --port $PORT
