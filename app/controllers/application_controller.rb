# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def authorize
    if(session[:user_id] == nil)
  		redirect_to :controller=>'login',:action=>'new'
    end
  end

  def logged
    if(session[:user_id] != nil)
      user=User.find_by(id:session[:user_id])
      if (user!=nil)
        if(user.role_id==Role.find_by(name:"Admin").id)
          redirect_to :controller=>'admin', :action=>'show' ,:id=>user.id
        elsif (user.role_id==Role.find_by(name:"Staff").id)
          redirect_to :controller=>'staff', :action=>'show',:id=>user.id
        elsif (user.role_id==Role.find_by(name:"Maid").id)
          redirect_to :controller=>'maid', :action=>'show',:id=>user.id 
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
  scheduler.cron '0 00 * * 1-5' do
    scheduler.in '8h' do
      UserNotifierMailer.shift_email.deliver_now!
    end
    scheduler.in '16h' do
      UserNotifierMailer.shift_email.deliver_now!
    end
    scheduler.in '23h59m' do
      UserNotifierMailer.shift_email.deliver_now!
    end
  end
end
