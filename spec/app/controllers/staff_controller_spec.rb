require 'spec_helper'
require 'rails_helper'

describe StaffController, type: :controller do
  it 'renders show' do
    user = User.create(name: 'user118',
                       email: 'user@example.com',
                       password: 'test1234',
                       phone_no: '123456789')
    path = "staff/#{user.id}"
    expect(get: path).to route_to('staff#show', id: "#{user.id}")
  end
  it 'renders edit' do
    user = User.create(name: 'user118',
                       email: 'user@example.com',
                       password: 'test1234',
                       phone_no: '123456789')
    path = "staff/#{user.id}/edit"
    expect(get: path).to route_to('staff#edit', id: "#{user.id}")
  end
end
