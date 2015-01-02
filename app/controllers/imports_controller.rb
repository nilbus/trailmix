class ImportsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @import = Import.new
  end

  def create
    flash[:error] = "Sorry, imports are disabled."
    redirect_to new_import_path
  end

  private

  def import_params
    params.require(:import).permit(:ohlife_export)
  end
end
