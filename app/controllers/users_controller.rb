# User controller
class UsersController < ApplicationController
  before_action :authorize
  before_action :check
  skip_before_filter :verify_authenticity_token, only: [:update]
  require 'digest/md5'
  def new
    check
    @shifts = Shift.find_each
  end

  def create
    begin_redirect(params)
    begin
      user_create(params)
    rescue StandardError => e
      flash_error(e, params)
    else
      create_redirect(params)
    end
  end

  def edit
    check
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:users]
      begin
        update_create(params)
      rescue StandardError => e
        flash_update_error(e, params[:id])
      else
        update_respond
      end
    end
  end

  def redirect
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { redirect_to hotel_path(@user.hotel_id) }
      format.js
    end
  end

  private

  def update_respond
    respond_to do |format|
      format.html { redirect_to hotel_path(@user.hotel_id) }
      format.js
    end
  end

  def flash_update_error(error, id)
    flash[:error] = error.message
    redirect_to action: 'edit', id: id
  end

  def update_create(params)
    @user.update_attributes(update_attrs(params))
    unless params[:users][:imageable].nil?
      @image = Image.find_by(imageable_id: @user.id, imageable_type: 'User')
      @image.update_attributes!(image: params[:users][:imageable])
    end
  end

  def begin_redirect(params)
    if params[:users][:password] != params[:password][:password]
      flash[:error] = 'Invalid password!!!'
      redirect_to action: 'new', id: params[:id]
    end
  end

  def create_redirect(params)
    Salary.create(user_id: User.last.id)
    flash[:success] = 'User Created !'
    redirect_to controller: 'hotels', action: 'show', id: params[:id]
  end

  def flash_error(error, params)
    if params[:roles] && params[:shift]
      flash[:error] = error.message
    else
      flash[:error] = 'Role must be specified!!' if params[:roles].nil?
      flash[:error] = 'Shift must be specified!!' if params[:shift].nil?
    end
    redirect_to action: 'new', id: params[:id]
  end

  def user_create(params)
    User.create(create_attrs(params))
    @user = User.last
    Image.create(image_attr(params))
    @user.update_attributes!(image_id: Image.last.id)
  end

  def image_attr(params)
    { image: params[:users][:imageable],
      imageable_id: User.last.id,
      imageable_type: 'User' }
  end

  def update_attrs(params)
    if params[:users][:name]
      { name: params[:users][:name] }
    elsif params[:users][:email]
      { email: params[:users][:email] }
    elsif params[:users][:phone_no]
      { phone_no: params[:users][:phone_no] }
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
      shift_id: params[:shift][:id] }
  end

  def check
    authorize! :manage, Hotel
  end
end
