# Sessions
class SessionsController < ApplicationController
  def create
    user = Client.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to controller: 'login', action: 'ath'
  end

  def destroy
    session[:user_id] = nil
    Client.destroy_all
    redirect_to root_path
  end
end
