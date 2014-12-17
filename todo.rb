$LOAD_PATH.unshift File.dirname(__FILE__)

require 'sinatra/base'
require 'task'

class ToDoApp < Sinatra::Base
  get "/" do
    @tasks = Task.all
    erb :index
  end

  post "/" do
    Task.create(params)
    redirect '/'
  end
end
