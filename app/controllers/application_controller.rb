# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url, alert: exception.message
  end

  def authorize
    if session[:user_id].nil?
      flash[:error] = 'Access Denied'
      redirect_to controller: 'login', action: 'new'
    end
  end

  def logged
    unless session[:user_id].nil?
      user = User.find_by(id: session[:user_id])
      unless user.nil?
        if user.role_id == Role.admin
          redirect_to controller: 'admin', action: 'show', id: user.id
        elsif user.role_id == Role.staff
          redirect_to controller: 'staff', action: 'show', id: user.id
        elsif user.role_id == Role.maid
          redirect_to controller: 'maid', action: 'show', id: user.id
        end
      end
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  scheduler = Rufus::Scheduler.new
  # scheduler.in '1s' do
  #   UserNotifierMailer.shift_email.deliver_now!
  # end

  # scheduler.in '1s' do
  #   Shift.morning
  # end
  @a = 11

  scheduler.cron "0 #{@a} * * 1-7" do
    UserNotifierMailer.shift_email.deliver_now!
  end
  scheduler.cron "0 #{Shift.morning.hour} * * 1-7" do
    UserNotifierMailer.shift_email.deliver_now!
  end
  scheduler.cron "0 #{Shift.evening.hour} * * 1-7" do
    UserNotifierMailer.shift_email.deliver_now!
  end
  scheduler.cron "0 #{Shift.night.hour} * * 1-7" do
    UserNotifierMailer.shift_email.deliver_now!
  end
end
