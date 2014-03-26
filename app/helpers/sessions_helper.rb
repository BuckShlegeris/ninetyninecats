module SessionsHelper
  def current_user
    puts ["looking for current session", session[:session_token]]
    current_session = Session.find_by_session_token(session[:session_token])
    p current_session
    if current_session
      current_session.user
    else
      nil
    end
  end

  def login!(user)
    new_token = SecureRandom.urlsafe_base64(16)

    current_session = Session.create!(:user_id => user.id,
                  :session_token => new_token,
                  :location => request.user_agent)

    session[:session_token] = new_token
    redirect_to cats_url
  end

  def logout!
    current_session = Session.find_by_session_token(session[:session_token])
    if current_session
      current_session.destroy
      session[:session_token] = nil
    end

    redirect_to cats_url
  end
end
