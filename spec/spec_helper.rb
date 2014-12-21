ENV['RACK_ENV'] = 'test'

require_relative '../config/environment.rb'
require_relative '../simple_store.rb'
require_relative '../todo.rb'
require_relative '../task.rb'
require_relative '../list.rb'

RSpec.configure do |config|
  # reset database before each example is run
  config.before(:each) { DataMapper.auto_migrate! }
end
