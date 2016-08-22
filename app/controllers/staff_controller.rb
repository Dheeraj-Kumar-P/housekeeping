# StaffController
class StaffController < ApplicationController
  before_action :authorize
  def show
    show_attr(params[:id])
    room = []
    @rooms1.each do |room1|
      room.push(room1.id)
    end
    @tasks.each do |task|
      room.delete(task.room_id)
    end
    @rooms = Room.where(room_attr(@staff.hotel_id, room)).find_each
  end

  def edit
    @user = User.find(params[:id])
    check(@user.id)
  end

  def update
    @user = User.find(params[:id])
    check(@user.id)
    begin
      @user.update_attributes(update_attrs(params))
    rescue StandardError => e
      flash_error(e, params[:id])
    else
      flash_msg
    end
  end

  private

  def show_attr(id)
    @staff = User.find(id)
    check(@staff.id)
    @maids = User.where(maid_attr(@staff.hotel_id)).find_each
    @tasks = TaskAssignment.where(status: 'assigned').find_each
    @rooms1 = Room.where(hotel_id: @staff.hotel_id).find_each
  end

  def flash_msg
    flash[:success] = 'Successfully updated!!'
    redirect_to action: 'show', id: session[:user_id]
  end

  def flash_error(error, id)
    flash[:error] = error.message
    redirect_to action: 'edit', id: id
  end

  def room_attr(hotel, room)
    {
      status: 'dirty',
      hotel_id: hotel,
      id: room
    }
  end

  def maid_attr(id)
    {
      hotel_id: id,
      shift_id: Shift.current_id,
      role_id: Role.maid
    }
  end

  def update_attrs(params)
    resultant_hash = {
      name: params[:users][:name],
      email: params[:users][:email],
      phone_no: params[:users][:phone_no]
    }
    if params[:users][:image].present?
      resultant_hash[:image] = params[:users][:image]
    end
    resultant_hash
  end

  def check(id)
    if id == session[:user_id]
      authorize! :read, Shift
    else
      authorize! :destroy, Role
    end
  end
end
