# Maid helper
module MaidHelper
  def task_helper
    hotel_id = User.find(params[:id]).hotel_id
    @rooms = Room.where(status: 'dirty', hotel_id: hotel_id).find_each
    assign_room
    redirect_to controller: 'staff', action: 'show', id: params[:id]
  end

  def delete_helper
    @user = TaskAssignment.find_by(room_id: params[:id], status: 'assigned')
    TaskAssignment.find_by(room_id: params[:id], status: 'assigned').destroy
    flash[:error] = 'Task deleted!!'
    redirect_to controller: 'maid', action: 'show', id: @user.user_id
  end

  def start_helper
    @task.update_attributes(start_time: Time.now)
    min = Time.now.min
    min = '0' + min.to_s if min < 10
    flash[:notice] = "Task started at #{Time.now.hour}:#{min}"
    redirect_to controller: 'maid', action: 'show', id: @task.user_id
  end

  def flash_error(error)
    flash[:error] = error.message
    redirect_to action: 'edit', id: session[:user_id]
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

  def update_redirect
    flash[:success] = 'Successfully updated!!'
    redirect_to action: 'show', id: session[:user_id]
  end

  def update_helper(params)
    User.update(params[:id], update_attrs(params))
    unless params[:users][:imageable].nil?
      @image = Image.find_by(imageable_id: @user.id, imageable_type: 'User')
      @image.update_attributes!(image: params[:users][:imageable])
    end
  end

  private

  def update_attrs(params)
    {
      name: params[:users][:name],
      email: params[:users][:email],
      phone_no: params[:users][:phone_no]
    }
  end
end
