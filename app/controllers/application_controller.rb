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
      user = User.find(session[:user_id])
      unless user.nil?
        redirect_admin(user)
        redirect_user(user)
      end
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  scheduler = Rufus::Scheduler.new
  scheduler.cron "0 #{Shift.morning.hour} * * 1-7" do
    UserNotifierMailer.shift_email.deliver_now!
  end
  scheduler.cron "0 #{Shift.evening.hour} * * 1-7" do
    UserNotifierMailer.shift_email.deliver_now!
  end
  scheduler.cron "0 #{Shift.night.hour} * * 1-7" do
    UserNotifierMailer.shift_email.deliver_now!
  end

  private

  def redirect_admin(user)
    redirect_to admin_path(user) if user.role_id == Role.admin
  end

  def redirect_user(user)
    redirect_to staff_path(user) if user.role_id == Role.staff
    redirect_to maid_path(user) if user.role_id == Role.maid
  end
end
