# Login
class LoginController < ApplicationController
  before_action :logged
  require 'digest/md5'
  def new
  end

  def block
  end

  def ath
    user ||= User.find_by(email: Client.last.email)
    redirect(user)
  end

  def create
    if params[:users][:name].empty? || params[:users][:password].empty?
      flash_msg
      render action: 'new'
    else
      user ||= User.find_by(create_attrs(params))
      redirect(user)
    end
  end

  private

  def create_attrs(params)
    pass = Digest::MD5.hexdigest(params[:users][:password])
    {
      name: params[:users][:name],
      password: pass
    }
  end

  def redirect(user)
    if user.nil?
      flash_invalid
    elsif user.is_active.zero?
      redirect_to login_block_path
    else
      flash_log(user)
      redirect_admin(user)
      redirect_user(user)
    end
  end

  def flash_log(user)
    flash[:success] = 'Successfully logged in!!'
    session[:user_id] = user.id
  end

  def flash_msg
    flash.now[:error] = 'Enter data!!!'
  end

  def flash_invalid
    flash[:error] = 'Invalid User'
    redirect_to controller: 'sessions', action: 'destroy'
  end
end
