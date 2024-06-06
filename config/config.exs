import Config

import_config("compiletime.exs")
import_config("compiletime_#{config_env()}.exs")
