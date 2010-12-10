# Remarkable devise_invitable

Remarkable RSpec matchers for
[devise_invitable](http://github.com/scambra/devise_invitable)
models. It should be used with
[remarkable_devise](http://github.com/vreys/remarkable_devise).

## Install

Add to your Gemfile:

    gem "remarkable_activerecord"
    gem "remarkable_devise"
    gem "remarkable_devise_invitable"

Add the require after the remarkabe/devise line in your spec_helper.rb:

    require "remarkable/active_record"
    require "remarkable/devise"
    require "remarkable/devise/invitable"

## Usage

Suppose that you have User model, wich should be an invitable. Specs
should look like this:

    # spec/models/user_spec.rb
    describe User do
      it { should be_an_invitable(:invite_for => 2.weeks) }
    end

## Documentation

Coming soon

## See also

* [http://github.com/scambra/devise_invitable](http://github.com/scambra/devise_invitable)
* [http://github.com/plataformatec/devise](http://github.com/plataformatec/devise)
* [http://github.com/rspec/rspec](http://github.com/rspec/rspec)
* [http://github.com/remarkable/remarkable](http://github.com/remarkable/remarkable)
* [http://github.com/vreys/remarkable_devise](http://github.com/vreys/remarkable_devise)
