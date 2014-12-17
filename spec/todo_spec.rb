require_relative '../todo.rb'
require 'rack/test'
require 'rspec'

describe 'ToDo App' do
  include Rack::Test::Methods

  def app
    ToDoApp.new
  end

  describe "POST /" do
    it "creates a new task" do
      post '/', description: "Need to learn meta-programming"
      expect(last_response.status).to eq 200
    end

    it "redirects to the home page after creating a new task" do
      post '/', description: "Need to learn meta-programming"
      puts last_response.class
      expect(last_response.redirect?).to be_true
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end
end
