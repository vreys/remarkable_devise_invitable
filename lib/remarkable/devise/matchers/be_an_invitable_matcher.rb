module Remarkable
  module Devise
    module Matchers
      class BeAnInvitableMatcher < Base
        arguments
        
        assertion :included?, :options_match?, :has_invitation_token_column?, :has_invitation_sent_at_column?

        optionals :invite_for

        protected
        
        def included?
          subject_class.ancestors.include?(::Devise::Models::Invitable)
        end
      end

      def be_an_invitable(*args, &block)
        BeAnInvitableMatcher.new(*args, &block).spec(self)
      end
    end
  end
end
