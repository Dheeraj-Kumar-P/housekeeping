# Hotels Controller
class HotelsController < ApplicationController
  before_action :authorize
  def new
  end

  def create
    begin
      Hotel.create(create_attrs(params))
    rescue Exception => e
      flash[:notice] = e.message
      redirect_to action: 'new'
    else
      for iteration in 101..((params[:hotels][:no_of_rooms].to_i) + 100)
        Room.create(no: iteration, hotel_id: Hotel.last.id, estimated_time:'01:00:00', status: 'dirty')
      end
      flash[:notice] = 'Hotel created!'
      redirect_to controller: 'admin', action: 'show', id: session[:user_id]
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
      User.update(params[:id], is_active: 1)
    else
      User.update(params[:id], is_active: 0)
    end
    redirect_to controller: 'hotels', action: 'show', id: @user.hotel_id
  end

  def create_attrs(params)
    { name: params[:hotels][:name],
      no_of_rooms: params[:hotels][:no_of_rooms],
      no_of_staff: params[:hotels][:no_of_staff],
      no_of_maid: params[:hotels][:no_of_maid] }
  end
end
