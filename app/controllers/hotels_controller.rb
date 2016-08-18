# Hotels Controller
class HotelsController < ApplicationController
  before_action :authorize
  before_action :check
  def new
    check
  end

  def create
    begin
      Hotel.create(create_attrs(params))
      @hotel = Hotel.last
    rescue StandardError => e
      flash[:error] = e.message
      redirect_to action: 'new'
    else
      Image.create(image_attr(params))
      @hotel.update_attributes!(image_id: Image.last.id)
      for iteration in 101..((params[:hotels][:no_of_rooms].to_i) + 100)
        Room.create(room_attrs(iteration))
      end
      flash[:success] = 'Hotel created!'
      redirect_to controller: 'admin', action: 'show', id: session[:user_id]
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    begin
      Hotel.update(params[:id], update_attrs(params))
      unless params[:hotels][:imageable].nil?
        @image = Image.find_by(imageable_id: params[:id], imageable_type: 'Hotel')
        @image.update_attributes!(image: params[:hotels][:imageable])
      end
    rescue StandardError => e
      flash[:error] = e.message
      redirect_to action: 'edit'
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
    if @user.is_active.zero?
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

  def image_attr(params)
    { image: params[:hotels][:imageable],
      imageable_id: Hotel.last.id,
      imageable_type: 'Hotel' }
  end

  def create_attrs(params)
    { name: params[:hotels][:name],
      no_of_rooms: params[:hotels][:no_of_rooms],
      address: params[:hotels][:address] }
  end

  def room_attrs(iteration)
    { no: iteration,
      hotel_id: Hotel.last.id,
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
end
