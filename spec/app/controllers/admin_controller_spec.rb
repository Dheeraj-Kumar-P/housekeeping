require 'spec_helper'
require 'rails_helper'

describe 'admin' do
  it 'responds successfully with an HTTP 200 status code' do
    get :show
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end
end
