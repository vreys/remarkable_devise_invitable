require 'mocha'

require File.join(File.dirname(__FILE__), '..', 'lib', 'remarkable', 'devise', 'invitable')

require 'example_models'

ActiveRecord::Base.establish_connection( :adapter => 'sqlite3',
                                         :database => ':memory:' )


RSpec.configure do |config|
  config.mock_with :mocha
end
