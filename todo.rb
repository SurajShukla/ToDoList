$LOAD_PATH.unshift File.dirname(__FILE__)

require 'sinatra/base'
require 'task'

class ToDoApp < Sinatra::Base
  get "/" do
    @tasks = [Task.new(description: "Create web application"),
              Task.new(description: "Profit!")]
    erb :index
  end
end
