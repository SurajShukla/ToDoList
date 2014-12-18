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

  patch '/:id' do
    task = Task.get(params[:id])
    task.update(done: params[:done])
    redirect '/'
  end
end
