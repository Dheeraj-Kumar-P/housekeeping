# User controller
class UsersController < ApplicationController
  before_action :authorize

  def new
    @shifts = Shift.find_each
  end

  def create
    require 'digest/md5'
    if params[:users][:name].empty? || params[:users][:password].empty? || params[:password][:password].empty? || params[:users][:email].empty? || params[:users][:phone_no].empty? ||params[:roles][:id].empty? || params[:shift][:id].empty?
      flash[:notice] = 'Enter Data!!!'
      redirect_to :action => 'new', :id => params[:id]
    elsif params[:users][:password] != params[:password][:password]
      flash[:notice] = 'Password fiels does not match!!!'
      redirect_to :action => 'new', :id => params[:id]
    else
      pass=Digest::MD5.hexdigest(params[:users][:password])
      byebug
      User.create(:name => params[:users][:name], :password => pass, :email => params[:users][:email], :phone_no => params[:users][:phone_no], :is_active => 1, :hotel_id => params[:id], :role_id => params[:roles][:id], :shift_id => params[:shift][:id])
      Salary.create(:user_id => User.last.id)
      redirect_to :controller => 'hotels', :action => 'show', :id => params[:id]
    end
  end
end
