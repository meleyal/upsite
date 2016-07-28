# This file is used by Rack-based servers to start the application.

$stdout.sync=true # https://git.io/vKFuo
require ::File.expand_path('../config/environment', __FILE__)
run Upsite::Application
