$LOAD_PATH.unshift __dir__

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
