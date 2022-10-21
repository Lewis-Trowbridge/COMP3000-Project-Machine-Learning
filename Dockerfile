FROM alpine:latest AS downloader
RUN apk --no-cache add wget unzip
RUN wget https://drive.google.com/uc?export=download&id=1-M7OuoNgEK4CUVBwaknhxyxoh59Ws9eH -o model.zip
RUN unzip model.zip

FROM tensorflow/serving:latest
COPY --from=downloader /model models/airquality
ENV MODEL_NAME=airquality
# Use existing entrypoint