require_relative './config/environment'

use Rack::MethodOverride
use SessionsController
use TasksController
use UsersController
run ApplicationController