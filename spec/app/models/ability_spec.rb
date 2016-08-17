require 'cancan/matchers'
require 'spec_helper'
require 'rails_helper'
describe 'ability' do
  let(:admin) { Ability.new(user) }
end
