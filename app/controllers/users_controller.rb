# User controller
class UsersController < ApplicationController
  before_action :authorize
  require 'rmagick'
  include Magick
  skip_before_filter :verify_authenticity_token, only: [:update]

  def new
    check
    @shifts = Shift.find_each
  end

  def create
    check
    require 'digest/md5'
    if params[:users][:password] != params[:password][:password]
      flash[:error] = 'Invalid password!!!'
      redirect_to action: 'new', id: params[:id]
    else
      begin
        User.create(create_attrs(params))
      rescue StandardError => e
        if params[:roles].nil?
          flash[:error] = 'Role must be specified!!'
        elsif params[:shift].nil?
          flash[:error] = 'Shift must be specified!!'
        else
          flash[:error] = e.message
        end
        redirect_to action: 'new', id: params[:id]
      else
        Salary.create(user_id: User.last.id)
        flash[:success] = 'User Created !'
        redirect_to controller: 'hotels', action: 'show', id: params[:id]
      end
    end
  end

  def edit
    check
    @user = User.find(params[:id])
  end

  def update
    check
    @user = User.find(params[:id])
    if params[:users]
      begin
        @user.update_attributes(update_attrs(params))
      rescue StandardError => e
        flash[:error] = e.message
        redirect_to action: 'edit', id: params[:id]
      else
        respond_to do |format|
          format.html { redirect_to controller: 'hotels', action: 'show', id: @user.hotel_id }
          format.js
        end
      end
    end
  end

  def redirect
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { redirect_to controller: 'hotels', action: 'show', id: @user.hotel_id }
      format.js
    end
  end

  private

  def update_attrs(params)
    if params[:users][:name]
      { name: params[:users][:name] }
    elsif params[:users][:email]
      { email: params[:users][:email] }
    elsif params[:users][:phone_no]
      { phone_no: params[:users][:phone_no] }
    elsif params[:users][:image]
      { image: params[:users][:image] }
    else
      {}
    end
  end

  def create_attrs(params)
    pass = Digest::MD5.hexdigest(params[:users][:password])
    { name: params[:users][:name],
      password: pass,
      email: params[:users][:email],
      phone_no: params[:users][:phone_no],
      is_active: 1,
      hotel_id: params[:id],
      role_id: params[:roles][:id],
      shift_id: params[:shift][:id],
      image: params[:users][:image] }
  end

  def check
    authorize! :manage, Hotel
  end
end
