FROM python:alpine AS downloader

COPY "download-models.py" .
COPY "generate-serving-config.py" .

RUN pip install onedrivedownloader
RUN python download-models.py
RUN python generate-serving-config.py

FROM tensorflow/serving:latest
COPY --from=downloader /models /models
COPY --from=downloader models.config .
# Use existing entrypoint
