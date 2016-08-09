# User controller
class UsersController < ApplicationController
  before_action :authorize
  require 'rmagick'
  include Magick

  def new
    @shifts = Shift.find_each
  end

  def create
    require 'digest/md5'
    if params[:users][:password] != params[:password][:password]
      flash[:notice] = 'Invalid password!!!'
      redirect_to action: 'new', id: params[:id]
    else
      begin
        User.create(create_attrs(params))
      rescue StandardError => e
        if params[:roles].nil?
          flash[:notice] = 'Role must be specified!!'
        elsif params[:shift].nil?
          flash[:notice] = 'Shift must be specified!!'
        else
          flash[:notice] = e.message
        end
        redirect_to action: 'new', id: params[:id]
      else
        Salary.create(user_id: User.last.id)
        flash[:notice] = 'User Created !'
        redirect_to controller: 'hotels', action: 'show', id: params[:id]
      end
    end
  end

  def edit
    @shifts = Shift.find_each
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    begin
      User.update(params[:id], update_attrs(params))
    rescue StandardError => e
      flash[:notice] = e.message
      redirect_to action: 'edit', id: params[:id]
    else
      redirect_to controller: 'hotels', action: 'show', id: @user.hotel_id
    end
  end

  private

  def update_attrs(params)
    { name: params[:users][:name],
      email: params[:users][:email],
      phone_no: params[:users][:phone_no],
      image: params[:users][:image] }
    # params.require(:users).permit(:image, :name, :email, :phone_no)
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
end
