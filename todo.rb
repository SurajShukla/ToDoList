$LOAD_PATH.unshift __dir__

require 'sinatra/base'
require 'data_mapper'
require 'task'

DATABASE_URL = ENV['DATABASE_URL'] || 'postgres://arup:arup@localhost/to_do_app'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, DATABASE_URL)

DataMapper.finalize
Task.auto_upgrade!

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

  delete '/:id' do
    task = Task.get(params[:id])
    task.destroy
    redirect '/'
  end
end
