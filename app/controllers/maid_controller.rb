# Maid controller
class MaidController < ApplicationController
  include MaidHelper
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
      update_helper(params)
    rescue StandardError => e
      flash_error(e)
    else
      update_redirect
    end
  end

  def task
    check_admin
    check_maid
    task_helper
  end

  def delete
    check_maid
    check_admin
    delete_helper
  end

  def cleaning
    @task = TaskAssignment.find_by(room_id: params[:id], status: 'assigned')
    check(@task.user_id)
    @room = Room.find(params[:id])
  end

  def start
    @task = TaskAssignment.find_by(room_id: params[:id], status: 'assigned')
    check(@task.user_id)
    start_helper
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

  def create_attrs(params, room)
    {
      user_id: params[:users][:id],
      room_id: room.id,
      task_id: Task.first.id,
      status: 'assigned'
    }
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
