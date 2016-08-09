# Login
class LoginController < ApplicationController
  before_action :logged
  require 'digest/md5'
  def new
  end

  def block
  end

  def ath
    if User.exists?(email: Client.last.email, is_active: 1, role_id: Role.admin)
      @user = User.find_by(email: Client.last.email, is_active: 1, role_id: Role.admin)
      session[:user_id] = @user.id
      redirect_to controller: 'admin', action: 'show', id: @user.id
    elsif User.exists?(email: Client.last.email, is_active: 1, role_id: Role.staff)
      @user = User.find_by(email: Client.last.email,is_active:1,role_id: Role.staff)
      session[:user_id] = @user.id
      redirect_to controller: 'staff', action: 'show', id: @user.id
    elsif User.exists?(email: Client.last.email, is_active: 1, role_id: Role.maid)
      @user = User.find_by(email: Client.last.email, is_active: 1, role_id: Role.maid)
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
    else
      pass = Digest::MD5.hexdigest(params[:users][:password])
      if User.exists?(name: params[:users][:name], password: pass, is_active: 1,role_id: Role.admin)
        @user = User.find_by(name: params[:users][:name], password: pass)
        session[:user_id] = @user.id
        redirect_to controller: 'admin', action: 'show', id: @user.id
      elsif User.exists?(name: params[:users][:name], password: pass, is_active: 1, role_id: Role.staff)
        @user = User.find_by(name: params[:users][:name], password: pass)
        session[:user_id] = @user.id
        redirect_to controller: 'staff', action: 'show', id: @user.id
      elsif User.exists?(name: params[:users][:name], password: pass, is_active: 1, role_id: Role.maid)
        @user = User.find_by(name: params[:users][:name], password: pass)
        session[:user_id] = @user.id
        redirect_to controller: 'maid', action: 'show', id: @user.id
      elsif User.exists?(is_active: 0)
        redirect_to controller: 'login', action: 'block'
      else
        flash[:notice] = 'Invalid User'
        redirect_to controller: 'sessions', action: 'destroy'
      end
    end
  end
end
