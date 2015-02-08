class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_filter :show_params

  protected

  def show_params
    puts "params: #{params.inspect}"
  end

  def layout_by_resource
    devise_controller? ? "skinny" : "application"
  end
end
