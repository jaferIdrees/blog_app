require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  context 'testing users home route' do
    it 'Should rennder users index page' do
      get '/'
      expect(response).to render_template('index')
    end

    it 'Rendered page should include "Listing Users"' do
      get '/'
      expect(response.body).to include('Listing Users')
    end

    it 'http status to be OK' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end

  context 'testing users show route' do
    before(:example) { get '/users/:id' }
    it 'Should rennder users show page' do
      expect(response).to render_template('show')
    end

    it 'Rendered page should include "Show selected user information"' do
      expect(response.body).to include('Show selected user information')
    end

    it 'http status to be OK' do
      expect(response).to have_http_status(:ok)
    end
  end
end
