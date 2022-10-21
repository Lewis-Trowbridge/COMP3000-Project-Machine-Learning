FROM alpine:latest AS downloader
RUN apk --no-cache add curl unzip
RUN curl "https://drive.google.com/uc?export=download&id=1-M7OuoNgEK4CUVBwaknhxyxoh59Ws9eH" -L --output model.zip
RUN mkdir model
RUN unzip model.zip -d model/

FROM tensorflow/serving:latest
COPY --from=downloader /model /models/airquality/1
ENV MODEL_NAME=airquality
# Use existing entrypoint
