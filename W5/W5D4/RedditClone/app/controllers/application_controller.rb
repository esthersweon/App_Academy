class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :current_user, :signed_in?,:is_moderator?

  private

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    session[:token] = user.reset_session_token!
    @current_user = user
  end

  def sign_out
    @current_user.try(:reset_session_token!)
    session[:token] = nil
  end

  def require_signed_in
    redirect_to new_session_url unless signed_in?
  end

  def is_moderator?(sub)
    sub.moderator_id == current_user.id
  end

end
