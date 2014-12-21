$LOAD_PATH.unshift __dir__

require 'task'
require 'list'

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

  post '/export' do
    list = List.new(Task.all)
    gist = Gist.gist(list.to_markdown, filename: 'To Do List.md')
    redirect gist['html_url']
  end
end
