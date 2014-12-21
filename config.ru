require './config/environment'
require './todo'

use Rack::MethodOverride

run ToDoApp
