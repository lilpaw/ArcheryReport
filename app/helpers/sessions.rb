helpers do

  def current_user
    if session[:access_token]
      User.find(session[:access_token])
    end

  end

end