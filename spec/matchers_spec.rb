require 'spec_helper'

describe Remarkable::Devise::Matchers do
  describe "#be_an_invitable" do
    it "should return an instance of Remarkable::Devise::Matchers::BeAnInvitableMatcher" do
      be_an_invitable(:invite_for => 3.weeks).should be_an_instance_of(Remarkable::Devise::Matchers::BeAnInvitableMatcher)
    end
  end
end
