# Login
class LoginController < ApplicationController
  before_action :logged
  require 'digest/md5'
  def new
  end

  def block
  end

  def ath
    if User.exists?(ath_attrs(Role.admin))
      @user = User.find_by(ath_attrs(Role.admin))
      session[:user_id] = @user.id
      redirect_to controller: 'admin', action: 'show', id: @user.id
    elsif User.exists?(ath_attrs(Role.staff))
      @user = User.find_by(ath_attrs(Role.staff))
      session[:user_id] = @user.id
      redirect_to controller: 'staff', action: 'show', id: @user.id
    elsif User.exists?(ath_attrs(Role.maid))
      @user = User.find_by(ath_attrs(Role.maid))
      session[:user_id] = @user.id
      redirect_to controller: 'maid', action: 'show', id: @user.id
    elsif User.exists?(is_active: 0)
      redirect_to controller: 'login', action: 'block'
    else
      flash[:notice] = 'Invalid User'
      redirect_to controller: 'sessions', action: 'destroy'
    end
  end

  def create
    if params[:users][:name].empty? || params[:users][:password].empty?
      flash[:notice] = 'Enter Data!!!'
      redirect_to action: 'new'
    elsif User.exists?(create_attrs(params, Role.admin))
      @user = User.find_by(create_attrs(params, Role.admin))
      session[:user_id] = @user.id
      redirect_to controller: 'admin', action: 'show', id: @user.id
    elsif User.exists?(create_attrs(params, Role.staff))
      @user = User.find_by(create_attrs(params, Role.staff))
      session[:user_id] = @user.id
      redirect_to controller: 'staff', action: 'show', id: @user.id
    elsif User.exists?(create_attrs(params, Role.maid))
      @user = User.find_by(create_attrs(params, Role.maid))
      session[:user_id] = @user.id
      redirect_to controller: 'maid', action: 'show', id: @user.id
    elsif User.exists?(is_active: 0)
      redirect_to controller: 'login', action: 'block'
    else
      flash[:notice] = 'Invalid User'
      redirect_to controller: 'sessions', action: 'destroy'
    end
  end

  def create_attrs(params, role)
    pass = Digest::MD5.hexdigest(params[:users][:password])
    { name: params[:users][:name],
      password: pass,
      is_active: 1,
      role_id: role }
  end

  def ath_attrs(role)
    { email: Client.last.email,
      is_active: 1,
      role_id: role }
  end
end
