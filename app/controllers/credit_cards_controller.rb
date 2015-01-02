class CreditCardsController < ApplicationController
  before_filter :authenticate_user!

  layout "skinny"

  def edit
  end

  def update
    flash.notice = "Credit card updated successfully"
    redirect_to action: :edit
  end
end
