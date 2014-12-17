require_relative '../todo.rb'
require 'rack/test'
require 'rspec'

describe 'ToDo App' do
  include Rack::Test::Methods

  def app
    ToDoApp.new
  end
end
