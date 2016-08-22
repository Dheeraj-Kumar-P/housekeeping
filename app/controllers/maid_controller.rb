# Maid controller
class MaidController < ApplicationController
  before_action :authorize
  def show
    check_admin
    @user = User.find(params[:id])
    @tasks = TaskAssignment.where(task1_attrs(params)).find_each
    show_assigned_room
  end

  def edit
    @user = User.find(params[:id])
    check(@user.id)
  end

  def update
    @user = User.find(session[:user_id])
    check(@user.id)
    begin
      User.update(params[:id], update_attrs(params))
    rescue StandardError => e
      flash_error(e)
    else
      update_redirect
    end
  end

  def task
    check_admin
    check_maid
    hotel_id = User.find(params[:id]).hotel_id
    @rooms = Room.where(status: 'dirty', hotel_id: hotel_id).find_each
    assign_room
    redirect_to controller: 'staff', action: 'show', id: params[:id]
  end

  def delete
    check_maid
    check_admin
    @user = TaskAssignment.find_by(room_id: params[:id], status: 'assigned')
    TaskAssignment.find_by(room_id: params[:id], status: 'assigned').destroy
    flash[:error] = 'Task deleted!!'
    redirect_to controller: 'maid', action: 'show', id: @user.user_id
  end

  def cleaning
    @task = TaskAssignment.find_by(room_id: params[:id], status: 'assigned')
    check(@task.user_id)
    @room = Room.find(params[:id])
  end

  def start
    start_now
    min = Time.now.min
    min = '0' + min.to_s if min < 10
    flash[:notice] = "Task started at #{Time.now.hour}:#{min}"
    redirect_to controller: 'maid', action: 'show', id: @task.user_id
  end

  def stop
    @task = TaskAssignment.find_by(room_id: params[:id], status: 'assigned')
    check(@task.user_id)
    TaskAssignment.update(@task.id, stop_attrs)
    salary_update
    Room.update(@task.room_id, status: 'clean')
    flash[:success] = 'Task Completed'
    redirect_to controller: 'maid', action: 'show', id: @task.user_id
  end

  private

  def flash_error(error)
    flash[:error] = error.message
    redirect_to action: 'edit', id: session[:user_id]
  end

  def update_redirect
    flash[:success] = 'Successfully updated!!'
    redirect_to action: 'show', id: session[:user_id]
  end

  def show_assigned_room
    room = []
    @tasks.each do |task|
      room.push(task.room_id)
    end
    @rooms = Room.where(id: room, status: 'dirty').find_each
    @tasks = TaskAssignment.where(task2_attrs(params)).find_each
  end

  def assign_room
    @rooms.each do |room|
      unless params[room.no.to_s].nil?
        TaskAssignment.create(create_attrs(params, room))
        flash[:success] = 'Task assigned!!'
      end
    end
  end

  def start_now
    @task = TaskAssignment.find_by(room_id: params[:id], status: 'assigned')
    check(@task.user_id)
    @task.update_attributes(start_time: Time.now)
  end

  def salary_update
    @task = TaskAssignment.find(@task.id)
    @salary = Salary.find_by(user_id: @task.user_id)
    @time = @task.stop_time - @task.start_time
    time_extraction
    @day = 0 # integer to show no of days worked
    salary_cal
    time = Time.gm(2000, 1, 1, @hour, @min, @sec)
    Salary.update(@salary.id, total_hours: time, date: @day)
  end

  def time_extraction
    @hour = @time / 3600
    @min = (@time % 3600) / 60
    @sec = (@time % 3600) % 60
  end

  def salary_cal
    unless @salary.total_hours.nil?
      time_add_salary
      @min += (@sec / 60)
      @hour += (@min / 60)
      @day += (@hour / 24)
      @hour = @hour % 24
      @min = @min % 60
      @sec = @sec % 60
    end
  end

  def time_add_salary
    @day = @salary.date
    @hour += @salary.total_hours.hour
    @min += @salary.total_hours.min
    @sec += @salary.total_hours.sec
  end

  def create_attrs(params, room)
    {
      user_id: params[:users][:id],
      room_id: room.id,
      task_id: Task.first.id,
      status: 'assigned'
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

  def stop_attrs
    { stop_time: Time.now,
      date: Date.today,
      status: 'done' }
  end

  def task1_attrs(params)
    { user_id: params[:id],
      status: 'assigned' }
  end

  def task2_attrs(params)
    { user_id: params[:id],
      status: 'done',
      date: Date.today }
  end

  def check(id)
    if id == session[:user_id]
      authorize! :read, Salary
      authorize! :manage, TaskAssignment
    else
      authorize! :destroy, Role
    end
  end

  def check_admin
    authorize! :read, TaskAssignment
  end

  def check_maid
    authorize! :read, Shift
  end
end
