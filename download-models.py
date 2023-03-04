import onedrivedownloader

onedrivedownloader.download(
    url="https://liveplymouthac-my.sharepoint.com/:u:/g/personal/lewis_trowbridge_students_plymouth_ac_uk/EWhsOiSmG-1ApMg8JkpF3uwByqaryuZE-xXQKXEocnLlhA?download=1",
    filename="temp_models",
    clean=True,
    force_download=True,
    unzip=True,
    unzip_path="models/temperature/1"
)

onedrivedownloader.download(
    url="https://liveplymouthac-my.sharepoint.com/:u:/g/personal/lewis_trowbridge_students_plymouth_ac_uk/EW0vq3_AIRtNpXLdvb_o3_8Baz7B43Zclu3re7jZQYGleg?download=1",
    filename="airquality_model",
    clean=True,
    force_download=True,
    unzip=True,
    unzip_path="models/airquality/1"
)

