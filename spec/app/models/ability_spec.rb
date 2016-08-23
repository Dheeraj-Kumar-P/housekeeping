require 'spec_helper'
require 'rails_helper'
require 'cancan/matchers'

describe 'ability' do
  let(:subject) { Ability.new(user) }
  let(:hotel) { Hotel.new }
  let(:shift) { Shift.new }
  let(:salary) { Salary.new }
  context 'admin' do
    let(:user) { double(class: User, role_id: Role.admin) }
    it 'can manage hotel' do
      subject.can?(:manage, hotel).should be true
    end
    it 'can read' do
      subject.can?(:read, shift).should be false
    end
    it 'can manage' do
      subject.can?(:read, salary).should be false
    end
  end
  context 'staff' do
    let(:user) { double(class: User, role_id: Role.staff) }
    it 'can read' do
      subject.can?(:read, shift).should be true
    end
    it 'can manage hotel' do
      subject.can?(:manage, hotel).should be false
    end
    it 'can manage' do
      subject.can?(:read, salary).should be false
    end
  end
  context 'maid' do
    let(:user) { double(class: User, role_id: Role.maid) }
    it 'can manage' do
      subject.can?(:read, salary).should be true
    end
    it 'can read' do
      subject.can?(:read, shift).should be false
    end
    it 'can manage hotel' do
      subject.can?(:manage, hotel).should be false
    end
  end
end
