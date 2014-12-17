require_relative '../todo.rb'
require 'rack/test'
require 'rspec'

describe 'ToDo App' do
  include Rack::Test::Methods

  def app
    ToDoApp.new
  end

  describe "POST /" do
    before do
      post '/', description: "Need to learn meta-programming"
    end
    it "redirects" do
      expect(last_response.redirection?).to be_truthy
    end

    it "redirects to the home page after creating a new task" do
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end
end
