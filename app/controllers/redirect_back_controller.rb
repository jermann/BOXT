class RedirectBackController < ApplicationController
  def redirect
    redirect_to session.delete(:return_to) || root_path
  end

  def store_location
    session[:return_to] = request.referer unless request.referer&.include?("/users")
    redirect_back_or_default(root_path)
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
