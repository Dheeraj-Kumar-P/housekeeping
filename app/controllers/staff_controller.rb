# StaffController
class StaffController < ApplicationController
  before_action :authorize
  def show
    check
    @staff = User.find(params[:id])
		@maids = User.where(hotel_id: @staff.hotel_id, shift_id: Shift.current_id, role_id: Role.maid).find_each
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
    check
    @user = User.find(params[:id])
  end

  def update
    check
    @user = User.find(params[:id])
    begin
      User.update(params[:id], update_attrs(params))
    rescue StandardError => e
      flash[:error] = e.message
      redirect_to action: 'edit', id: params[:id]
    else
      flash[:success] = 'Successfully updated!!'
      redirect_to action: 'show', id: session[:user_id]
    end
  end

  private

  def update_attrs(params)
    if params[:users][:image].nil?
      { name: params[:users][:name],
        email: params[:users][:email],
        phone_no: params[:users][:phone_no] }
    else
      { name: params[:users][:name],
        email: params[:users][:email],
        phone_no: params[:users][:phone_no],
        image: params[:users][:image] }
    end
  end

  def check
    authorize! :read, Shift
  end
end
