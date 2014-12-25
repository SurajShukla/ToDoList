require_relative 'spec_helper.rb'

describe 'ToDo App' do
  include Rack::Test::Methods

  def app
    ToDoApp.new
  end

  describe "routes" do
    describe "POST /" do
      it "redirects to the home page after creating a new task" do
        post '/', description: "Need to learn meta-programming"
        expect(last_response).to be_a_redirect and include("Location" => '/')
      end
    end

    describe "GET /" do
      it "displays Home page" do
        allow(Forecast).to receive(:ten_day_forecast).with('GA', 'Atlanta')
        get '/'
        expect(last_response).to be_ok
      end
    end

    describe "PATCH /:id" do
      it 'redirects to a home page after updating a task' do
        task = Task.create(description: 'Add a test')
        patch "/#{task.id}"
        expect(last_response).to be_a_redirect and include("Location" => '/')
      end
    end

    describe "DELETE /:id" do
      it 'redirects to the home page after deleting the task' do
        task = Task.create(description: 'Add a test')
        delete "/#{task.id}"
        expect(last_response).to be_a_redirect and include("Location" => '/')
      end
    end

    describe "/export" do
      let(:gist) { double('Gist') }
      let(:url) { "http://example.org/gist" }

      it 'exports as a gist' do
        allow_any_instance_of(List).to receive(:to_gist) { gist }
        allow(gist).to receive(:[]).with('html_url').and_return(url)
        post "/export"
        expect(last_response).to be_redirect
        expect(last_response.location).to eq(url)
      end
    end
  end
end
