class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_person

  def current_person
    Person.find_by(email: current_user.email)
  end
end
