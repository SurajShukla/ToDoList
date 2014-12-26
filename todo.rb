$LOAD_PATH.unshift __dir__

require 'task'
require 'list'
require 'forecast'

Task.auto_upgrade!

class ToDoApp < Sinatra::Base
  get "/" do
    @tasks = Task.all
    @forecast = Forecast.ten_day_forecast('GA', 'Atlanta')
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
    gist = List.new(Task.all).to_gist
    redirect gist['html_url']
  end

  get '/:id' do
    @task = Task.get(params[:id])
    erb :show
  end

  put "/:id" do
    task = Task.get(params[:id])
    task.update(
      description: params[:description],
      done: params[:done],
      due_date: params[:due_date]
    )
    redirect '/'
  end
end
