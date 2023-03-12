import pathlib

def get_model_serving_config(info: dict):
    return f"""config {{
        name: '{info["name"]}'
        base_path: '{info["path"]}'
        model_platform: 'tensorflow'
    }}\n"""


path = pathlib.Path(".")

paths = [ {"path": str(relative_path.parent.parent.absolute()), "name": relative_path.parent.parent.name} for relative_path in path.glob("./models/**/keras_metadata.pb")]

# Created config following https://www.tensorflow.org/tfx/serving/serving_config#model_server_configuration
serving_config = f"""model_config_list {{
    {"    ".join([get_model_serving_config(path_info) for path_info in paths ])}
}}"""

print("Serving config:\n", serving_config)

with open("models.config", "w") as config_file:
    config_file.write(serving_config)