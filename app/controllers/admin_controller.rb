# Admin controller
class AdminController < ApplicationController
  before_action :authorize
  def show
    authorize! :manage, Hotel
    authorize! :manage, User
    @hotels = Hotel.find_each
  end
end
