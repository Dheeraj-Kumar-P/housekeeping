# Maid controller
class MaidController < ApplicationController
  before_action :authorize
  def show
    @tasks = TaskAssignment.where(user_id: params[:id], status: 'assigned').find_each
    room = []
    @tasks.each do |task|
      room.push(task.room_id)
    end
    @rooms = Room.where(id: room, status: 'dirty').find_each
    @tasks = TaskAssignment.where(user_id: params[:id],status: 'done',date: Date.today).find_each
  end

  def task
    hotel_id = User.find(params[:id]).hotel_id
    @rooms = Room.where(status: 'dirty', hotel_id: hotel_id).find_each
    @rooms.each do |room|
      unless params[room.no.to_s].nil?
        TaskAssignment.create(:user_id=>params[:users][:id],:room_id=> room.id,:task_id=>Task.first.id,:status=>"assigned")
      end
    end
    redirect_to :controller=>'staff', :action=>'show',:id=>params[:id]
  end

  def delete
    @user = TaskAssignment.find_by(room_id: params[:id], status: 'assigned')
    TaskAssignment.find_by(room_id: params[:id], status: 'assigned').destroy
    redirect_to :controller => 'maid', :action => 'show', :id => @user.user_id
  end

  def cleaning
    @task = TaskAssignment.find_by(room_id: params[:id],status: 'assigned')
    @room = Room.find(params[:id])
  end

  def start
    @task = TaskAssignment.find_by(room_id: params[:id], status: 'assigned')
    TaskAssignment.update(@task.id, :start_time => Time.now)
    redirect_to :controller => 'maid', :action => 'show', :id => @task.user_id
  end

  def stop
    require 'date'
    @task = TaskAssignment.find_by(room_id: params[:id], status: 'assigned')
    TaskAssignment.update(@task.id, :stop_time=>Time.now, :status => 'done', :date => Date.today)
    @salary = Salary.find_by(user_id: @task.user_id)
    @task = TaskAssignment.find(@task.id)
    time = @task.stop_time - @task.start_time
    hour = time / 3600
    min = (time % 3600) / 60
    sec = (time % 3600) % 60
    day = 0	# integer to show no of days worked
    # date and time is being added with that in salary
    unless @salary.total_hours.nil?
      day = @salary.date
      hour += @salary.total_hours.hour
      min += @salary.total_hours.min
      sec += @salary.total_hours.sec
      min += (sec / 60)
      hour += (min / 60)
      day += (hour / 24)
      hour = hour % 24
      min = min % 60
      sec = sec % 60
    end
    time = Time.gm(2000, 1, 1, hour, min, sec)
    Salary.update(@salary.id, :total_hours => time, :date => day)
    Room.update(@task.room_id, :status=>'clean')
    redirect_to :controller => 'maid', :action => 'show', :id => @task.user_id
  end
end
