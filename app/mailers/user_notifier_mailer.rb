# User notifier
class UserNotifierMailer < ApplicationMailer
  default from: 'dheeraj@qburst.com'

  def shift_email
    require 'date'
    @user = User.find_by(role_id: Role.admin)
    @shift = User.where(user_attrs).find_each
    @room = TaskAssignment.where(date: Date.today, status: 'done').find_each
    @work = TaskAssignment.where(status: 'assigned').find_each
    mail(to: @user.email, subject: 'Shift Status')
  end

  def user_attrs
    { role_id: [Role.maid, Role.staff],
      shift_id: Shift.current_id }
  end
end
