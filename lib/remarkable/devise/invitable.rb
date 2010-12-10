# load raiks
require 'action_pack'
require 'active_record'
require 'action_controller'

# load remarkable_devise
require 'remarkable/core'
require 'remarkable/active_record'
require 'remarkable/devise'

# load devise
require 'devise'
require 'devise/orm/active_record'
require 'devise_invitable'

dir = File.dirname(__FILE__)

# Add default locale
Dir["#{dir}/../../../locale/*yml"].each {|f| Remarkable.add_locale(f) }

# Add matchers
require File.join(dir, 'matchers', 'be_an_invitable_matcher')

Remarkable.include_matchers!(Remarkable::Devise, RSpec::Core::ExampleGroup)
