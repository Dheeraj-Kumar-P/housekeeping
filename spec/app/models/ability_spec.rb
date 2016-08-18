require 'cancan/matchers'
require 'spec_helper'
require 'rails_helper'
describe Ability do
  describe 'user' do
    user = User.new
    ability = Ability.new(user)
    hotel = Hotel.new
    expect(ability).to be_able_to(:manage, hotel)
  end
end
