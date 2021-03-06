require 'spec_helper'
require 'rails_helper'
describe '.create' do
  it 'should create a new instance given valid attributes' do
    Hotel.create(name: 'testhotel',
                 no_of_rooms: '64',
                 address: 'test1234')
  end

  it 'should not create a new instance given blank hotel name' do
    Hotel.create(name: '',
                 no_of_rooms: '20',
                 address: 'test1234')
  end

  it 'should not create a new instance given blank no_of_rooms' do
    Hotel.create(name: 'hotel',
                 no_of_rooms: '',
                 address: '123456789')
  end

  it 'should not create a new instance given blank address' do
    Hotel.create(name: 'hotel',
                 no_of_rooms: '30',
                 address: '')
  end
end

describe HotelsController, type: :controller do
  it 'renders new' do
    hotel = Hotel.create(name: 'testhotel',
                         no_of_rooms: '64',
                         address: 'test1234')
    path = "hotels/#{hotel.id}/new"
    expect(get: path).to route_to('hotels#new', id: "#{hotel.id}")
  end
  it 'renders show' do
    hotel = Hotel.create(name: 'testhotel',
                         no_of_rooms: '64',
                         address: 'test1234')
    path = "hotels/#{hotel.id}"
    expect(get: path).to route_to('hotels#show', id: "#{hotel.id}")
  end
end
