$LOAD_PATH.unshift File.dirname(__FILE__)

require 'sinatra/base'
require 'task'

Task.create(description: "Create web application")
Task.create(description: "Profit!")

class ToDoApp < Sinatra::Base
  get "/" do
    @tasks = Task.all
    erb :index
  end
end
