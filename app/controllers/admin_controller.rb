# Admin controller
class AdminController < ApplicationController
  before_action :authorize
  def show
    @hotels = Hotel.find_each
  end
end
