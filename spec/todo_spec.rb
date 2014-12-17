require_relative '../todo.rb'
require 'rack/test'
require 'rspec'

describe 'ToDo App' do
  include Rack::Test::Methods

  def app
    ToDoApp.new
  end

  describe "POST /" do
    it "redirects to the home page after creating a new task" do
      post '/', description: "Need to learn meta-programming"
      expect(last_response).to be_a_redirect and include("Location" => '/')
    end
  end

  describe "GET /" do
    it "displays Home page" do
      get '/'
      expect(last_response).to be_ok
    end
  end
end
