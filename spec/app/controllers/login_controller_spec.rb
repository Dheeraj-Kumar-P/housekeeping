require 'spec_helper'
require 'rails_helper'

describe LoginController, type: :controller do
  describe 'get new' do
    it 'renders new' do
      get :new
      expect(response).to render_template('new')
    end
  end
  describe 'get block' do
    it 'renders block' do
      get :block
      expect(response).to render_template('block')
    end
  end
  describe '#redirect' do
    let(user) { double(class: User, role_id: Role.admin) }
    get :redirect
    expect(response).to redirect_to('admin_path(user)')
  end
end
