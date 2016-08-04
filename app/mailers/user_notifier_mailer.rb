# User notifier
class UserNotifierMailer < ApplicationMailer
  default from: 'dk1563@gmail.com'

  def shift_email
    require 'date'
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
    @shift_id = @time
    @shift = User.where(role_id: [2, 3], shift_id: @time).find_each
    @room_cleaned = TaskAssignment.where(date: Date.today, status: 'done').find_each
    @work = TaskAssignment.where(status: 'assigned').find_each
    mail( :to => 'dheeraj@qburst.com', :subject => 'Shift Status' )
  end
end
