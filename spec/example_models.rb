class User < ActiveRecord::Base
  devise :invitable, :invite_for => 3.days
end

class FooUser < ActiveRecord::Base
  
end
