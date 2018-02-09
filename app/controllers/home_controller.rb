class HomeController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?

  def index
  end
end
