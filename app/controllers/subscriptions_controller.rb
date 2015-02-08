class SubscriptionsController < ApplicationController
  def create
    user = build_user

    if user.valid?
      create_subscription(user)
      send_welcome_email(user)
      sign_in(user)
      redirect_to entries_path
    else
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to new_registration_path
    end
  end

  private

  def build_user
    User.new(email: params[:email],
             password: params[:password])
  end

  def create_subscription(user)
    user.save!
    user.create_subscription!(stripe_customer_id: "")
  end

  def send_welcome_email(user)
    WelcomeMailerWorker.perform_async(user.id)
  end
end
