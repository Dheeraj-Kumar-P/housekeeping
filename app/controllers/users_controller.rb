# User controller
class UsersController < ApplicationController
  include UsersHelper
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

  def update
    @user = User.find(params[:id])
    begin
      update_create(params)
    rescue StandardError => e
      flash_update_error(e)
    else
      update_respond
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

  def update_create(params)
    @user.update_attributes!(update_attrs(params))
    unless params[:users][:imageable].nil?
      @image = Image.find_by(imageable_id: @user.id, imageable_type: 'User')
      @image.update_attributes!(image: params[:users][:imageable])
    end
  end

  def update_respond
    respond_to do |format|
      format.html { redirect_to hotel_path(@user.hotel_id) }
      format.js
    end
  end

  def flash_update_error(error)
    @alert = error.message
    @user = User.find(params[:id])
    respond_to do |format|
      format.html { redirect_to hotel_path(@user.hotel_id) }
      format.js
    end
  end

  def image_attr(params)
    { image: params[:users][:imageable],
      imageable_id: @user.id,
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

  def check
    authorize! :manage, Hotel
  end
end
