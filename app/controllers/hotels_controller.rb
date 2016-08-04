# Hotels Controller
class HotelsController < ApplicationController
  before_action :authorize
  def new
  end

  def create
    if (params[:hotels][:name].empty? || params[:hotels][:no_of_rooms].empty? || params[:hotels][:no_of_staff].empty? || params[:hotels][:no_of_maid].empty?)
      flash[:notice] = "Enter Data!!!"
      redirect_to :action => 'new'
    else
      Hotel.create(:name=>params[:hotels][:name],:no_of_rooms=>params[:hotels][:no_of_rooms],:no_of_staff=>params[:hotels][:no_of_staff],:no_of_maid=>params[:hotels][:no_of_maid])
      for iteration in 101..((params[:hotels][:no_of_rooms].to_i) + 100)
      Room.create(:no=>iteration,:hotel_id=>Hotel.last.id,:estimated_time=>"01:00:00",:status=>"clean")
    end
      redirect_to controller: 'admin', action: 'show', id: session[:user_id]
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @staffs = User.where(hotel_id: params[:id], role_id: Role.find_by(name: 'Staff').id).find_each
    @maids = User.where(hotel_id: params[:id], role_id: Role.find_by(name: 'Maid').id).find_each
  end

  def block
    @users = User.where(hotel_id: params[:id]).find_each
    @users.each do |user|
      if params[user.id.to_s]['true'] == '1'
        User.update(user.id, is_active: '0')
      else
        User.update(user.id, is_active: '1')
      end
    end
    redirect_to controller: 'admin', action: 'show', id: session[:user_id]
  end
end
