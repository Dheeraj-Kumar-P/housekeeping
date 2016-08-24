# Hotels Controller
class HotelsController < ApplicationController
  before_action :authorize
  before_action :check
  def new
    check
  end

  def create
    check
    begin
      @hotel = Hotel.create(create_attrs(params))
    rescue StandardError => error
      flash_error(error, 'new')
    else
      image_room_create(params)
      redirect_to admin_path(session[:user_id])
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    check
    begin
      update_hotel(params)
    rescue StandardError => e
      flash_error(e, 'edit')
    else
      flash[:success] = 'Successfully updated!!'
      redirect_to action: 'show', id: params[:id]
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @staffs = User.where(hotel_id: params[:id], role_id: Role.staff).find_each
    @maids = User.where(hotel_id: params[:id], role_id: Role.maid).find_each
  end

  def block
    @user = User.find(params[:id])
    if @user.is_active.to_i.zero?
      @user.update_attributes!(is_active: true)
    else
      @user.update_attributes!(is_active: false)
    end
    respond_to do |format|
      format.html { redirect_to action: 'show', id: @user.hotel_id }
      format.js
    end
  end

  private

  def flash_error(error, action)
    flash[:error] = error.message
    redirect_to action: action
  end

  def image_room_create(params)
    @image = Image.create(image_attr(params))
    @hotel.update_attributes!(image_id: @image.id)
    iteration = 101..(params[:hotels][:no_of_rooms].to_i + 100)
    iteration.each do |room_no|
      Room.create(room_attrs(room_no))
    end
    flash[:success] = 'Hotel created!'
  end

  def image_attr(params)
    {
      image: params[:hotels][:imageable],
      imageable_id: @hotel.id,
      imageable_type: 'Hotel'
    }
  end

  def update_img(id)
    {
      imageable_id: id,
      imageable_type: 'Hotel'
    }
  end

  def create_attrs(params)
    { name: params[:hotels][:name],
      no_of_rooms: params[:hotels][:no_of_rooms],
      address: params[:hotels][:address] }
  end

  def room_attrs(room_no)
    { no: room_no,
      hotel_id: @hotel.id,
      estimated_time: '01:00:00',
      status: 'dirty' }
  end

  def update_attrs(params)
    { name: params[:hotels][:name],
      address: params[:hotels][:address] }
  end

  def check
    authorize! :manage, Hotel
  end

  def update_hotel(params)
    Hotel.update(params[:id], update_attrs(params))
    unless params[:hotels][:imageable].nil?
      @image = Image.find_by(update_img(params[:id]))
      @image.update_attributes!(image: params[:hotels][:imageable])
    end
  end
end
