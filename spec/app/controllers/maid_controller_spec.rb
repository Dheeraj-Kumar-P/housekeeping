require 'spec_helper'
require 'rails_helper'

describe MaidController, type: :controller do
  it 'renders show' do
    user = User.create(name: 'user118',
                       email: 'user@example.com',
                       password: 'test1234',
                       phone_no: '123456789')
    path = "maid/#{user.id}"
    expect(get: path).to route_to('maid#show', id: "#{user.id}")
  end
  it 'renders edit' do
    user = User.create(name: 'user118',
                       email: 'user@example.com',
                       password: 'test1234',
                       phone_no: '123456789')
    path = "maid/#{user.id}/edit"
    expect(get: path).to route_to('maid#edit', id: "#{user.id}")
  end
  it 'renders cleaning' do
    user = User.create(name: 'user118',
                       email: 'user@example.com',
                       password: 'test1234',
                       phone_no: '123456789')
    path = "maid/#{user.id}/cleaning"
    expect(get: path).to route_to('maid#cleaning', id: "#{user.id}")
  end
  it 'renders delete' do
    user = User.create(name: 'user118',
                       email: 'user@example.com',
                       password: 'test1234',
                       phone_no: '123456789')
    path = "maid/#{user.id}/delete"
    expect(get: path).to route_to('maid#delete', id: "#{user.id}")
  end
  it 'should assign same task to different maids' do
    user1 = User.create(name: 'user1',
                        email: 'user@example.com',
                        password: 'test1234',
                        phone_no: '123456789')
    user2 = User.create(name: 'user2',
                        email: 'user@example.com',
                        password: 'test1234',
                        phone_no: '123456789')
    room = Room.create
    TaskAssignment.create(room_id: room.id, status: 'dirty', user_id: user1.id)
    TaskAssignment.create(room_id: room.id, status: 'dirty', user_id: user2.id)
  end
  it 'should assign same task to same maid if status is different' do
    user1 = User.create(name: 'user1',
                        email: 'user@example.com',
                        password: 'test1234',
                        phone_no: '123456789')
    room = Room.create
    TaskAssignment.create(room_id: room.id, status: 'clean', user_id: user1.id)
    TaskAssignment.create(room_id: room.id, status: 'dirty', user_id: user1.id)
  end
  it 'should assign same task to different maids if status is different' do
    user1 = User.create(name: 'user1',
                        email: 'user@example.com',
                        password: 'test1234',
                        phone_no: '123456789')
    user2 = User.create(name: 'user2',
                        email: 'user@example.com',
                        password: 'test1234',
                        phone_no: '123456789')
    room = Room.create
    TaskAssignment.create(room_id: room.id, status: 'clean', user_id: user1.id)
    TaskAssignment.create(room_id: room.id, status: 'dirty', user_id: user2.id)
  end
end
