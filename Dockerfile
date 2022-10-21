FROM alpine:latest AS downloader
RUN apk --no-cache add curl unzip
RUN mkdir model
RUN curl "https://drive.google.com/uc?export=download&id=1-M7OuoNgEK4CUVBwaknhxyxoh59Ws9eH" -L --output model/model.zip
RUN unzip model/model.zip

FROM tensorflow/serving:latest
COPY --from=downloader /model models/airquality
ENV MODEL_NAME=airquality
# Use existing entrypoint
