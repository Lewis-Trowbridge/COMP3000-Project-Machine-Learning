FROM python:alpine AS downloader
RUN apk --no-cache add curl unzip
RUN curl "https://drive.google.com/uc?export=download&id=1-M7OuoNgEK4CUVBwaknhxyxoh59Ws9eH" -L --output airquality_models.zip
RUN curl "https://liveplymouthac-my.sharepoint.com/:u:/r/personal/lewis_trowbridge_students_plymouth_ac_uk/Documents/Year%203/COMP3000/Models/temperature%203%20layer/temp_models.zip?download=1" -L --output temp_models.zip

COPY "generate-serving-config.py" .
RUN mkdir -p models/airquality/model
RUN mkdir -p models/temperature

# Unzip into single folder for single model
RUN unzip airquality_models.zip -d models/airquality/model/1

# Unzip into base foler for multiple models
RUN unzip temp_models.zip -d models/temperature
RUN python generate-serving-config.py

FROM tensorflow/serving:latest
COPY --from=downloader /models /models
COPY --from=downloader models.config .
# Use existing entrypoint
