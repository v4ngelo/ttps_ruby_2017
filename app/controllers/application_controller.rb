class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  protect_from_forgery with: :exception
end
