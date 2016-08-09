# StaffController
class StaffController < ApplicationController
  before_action :authorize

  def show
    @staff = User.find(params[:id])
    @shift_all = Shift.find_each
    @shift_all.each do |shift|
      if shift.end_time.hour == 0
        end_hour = 24
      else
        end_hour = shift.end_time.hour
      end
      if shift.start_time.hour <= Time.now.hour && Time.now.hour < end_hour
        @time = shift.id
      end
    end
		@maids = User.where(hotel_id: @staff.hotel_id, shift_id: @time, role_id: Role.maid).find_each
    @tasks = TaskAssignment.where(status: 'assigned').find_each
    @rooms1 = Room.where(hotel_id: @staff.hotel_id).find_each
    room = []
    @rooms1.each do |room1|
      room.push(room1.id)
    end
    @tasks.each do |task|
      room.delete(task.room_id)
    end
    @rooms = Room.where(status: 'dirty', hotel_id: @staff.hotel_id, id: room).find_each
  end

  def edit
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
      redirect_to action: 'show', id: session[:user_id]
    end
  end

  def update_attrs(params)
    { name: params[:users][:name],
      email: params[:users][:email],
      phone_no: params[:users][:phone_no],
      image: params[:users][:image] }
  end
end
