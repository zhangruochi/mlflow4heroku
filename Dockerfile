FROM continuumio/miniconda3

LABEL maintainer "ruochi zhang"

ENV HOME /
WORKDIR $HOME
COPY . $HOME

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \ 
    pwd && ls && ls home &&  \ 
    conda update -n base -c defaults conda && \ 
    conda env list && \ 
    pip freeze list  && \ 
    which mlflow 

EXPOSE 5000

CMD - mlflow server \
    --backend-store-uri sqlite:///mlflow.db \
    --default-artifact-root wasbs://copper@comr2.blob.core.windows.net/models \
    --host 0.0.0.0

### TODO ###
# 1. set up conda env route 
# 2. run demo exp after mlflow env build success
# 3. set up model config via .yml
# 4. load more examples and pipelines 
# 5. push deploy/train output to slack/s3