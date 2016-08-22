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
end
