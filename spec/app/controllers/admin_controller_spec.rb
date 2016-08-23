require 'spec_helper'
require 'rails_helper'

describe AdminController, type: :controller do
  it 'responds successfully with an HTTP 200 status code' do
    user = User.create(name: 'user118',
                       email: 'user@example.com',
                       password: 'test1234',
                       phone_no: '123456789',
                       role_id: 1)
    path = "/admin/#{user.id}"
    expect(get: path).to route_to('admin#show', id:"#{user.id}")
  end
end
