require 'spec_helper'

describe Remarkable::Devise::Matchers::BeAnInvitableMatcher do
  before do
    @valid_columns = ['invitation_token', 'invitation_sent_at']

    User.stubs(:column_names).returns(@valid_columns)
  end

  describe "validate inclusion of Devise::Models::Invitable" do
    context "when module is included" do
      it "should match" do
        subject.matches?(User).should be_true
      end
    end

    context "when module is not included" do
      it "should not match" do
        subject.matches?(FooUser).should be_false
      end
    end
  end

  describe "options validation" do
    describe :invite_for do
      context "when a model has expected :invite_for value" do
        it "should match" do
          subject.class.new(:invite_for => 3.days).matches?(User).should be_true
        end
      end

      context "when a model hasn't expected :invite_for value" do
        it "should not match" do
          subject.class.new(:invite_for => 4.weeks).matches?(User).should be_false
        end
      end
    end
  end

  describe "columns validation" do
    describe :invitation_token do
      context "when a model has invitation_token column" do
        it "should match" do
          subject.matches?(User).should be_true
        end
      end

      context "when a model hasn't invitation token column" do
        it "should not match" do
          User.stubs(:column_names).returns(@valid_columns - ['invitation_token'])

          subject.matches?(User).should be_false
        end
      end
    end

    describe :invitation_sent_at do
      context "when a model has invitation_sent_at column" do
        it "should match" do
          subject.matches?(User).should be_true
        end
      end

      context "when a model hasn't invitation_sent_at column" do
        it "should not match" do
          User.stubs(:column_names).returns(@valid_columns - ['invitation_sent_at'])

          subject.matches?(User).should be_false
        end
      end
    end
  end

  describe "description message" do
    context "when matching without options" do
      specify { subject.description.should eql("be an invitable") }
    end

    context "when matching with :invite_for option" do
      before do
        @matcher = subject.class.new(:invite_for => 3.days)
        @matcher.matches?(User)
      end

      specify { @matcher.description.should eql("be an invitable for 3 days") }
    end
  end

  describe "failure message" do
    context "when Devise::Models::Invitable is not included" do
      before do
        subject.matches?(FooUser)
      end

      specify { subject.failure_message_for_should.should match("Foo user to have Devise :invitable model") }
    end

    context "when a model hasn't invitation_token column" do
      before do
        User.stubs(:column_names).returns(@valid_columns - ['invitation_token'])

        subject.matches?(User)
      end

      specify { subject.failure_message_for_should.should match("User to have invitation_token column") }
    end

    context "when a model hasn't inbitation_sent_at column" do
      before do
        User.stubs(:column_names).returns(@valid_columns - ['invitation_sent_at'])

        subject.matches?(User)
      end

      specify { subject.failure_message_for_should.should match("User to have invitation_sent_at column") }
    end

    context "when a model hasn't expected options" do
      before do
        @matcher = subject.class.new(:invite_for => 4.weeks)
        @matcher.matches?(User)
      end

      specify { @matcher.failure_message_for_should.should match("User to be an invitable with options (.+), got (.+)") } 
    end
  end
end
