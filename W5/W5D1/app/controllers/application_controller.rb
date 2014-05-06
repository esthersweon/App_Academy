class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  helper_method :current_user#, :logged_in?

  private

  def current_user
    User.find_by_session_token(session[:token])
  end
  #
  # def logged_in?
  #   !!current_user
  # end

  def login(user)
    session[:token] = SecureRandom.hex
    user.session_token = session[:token]
    user.save!
    p user
    user = User.find(1)
    user.email = "asdf"

  end

  def logout
    current_user.session_token = SecureRandom.hex
    session[:token] = nil
  end

end
