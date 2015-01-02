require "rails_helper"

describe CancellationsController do
  describe "#create" do
    context "when signed in" do
      it "destroys the current user" do
        subscription = create(:subscription)
        user = subscription.user
        sign_in(user)

        post :create, id: user.id

        expect(User.count).to be_zero
      end

      it "creates a Cancellation" do
        subscription = create(:subscription)
        user = subscription.user

        sign_in(user)
        post :create, id: user.id, reason: "I'm done journaling"
        cancellation = Cancellation.last

        expect(cancellation.reason).to eq("I'm done journaling")
      end
    end

    context "when signed out" do
      it "redirects to sign in" do
        post :create, id: "not an id"

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
