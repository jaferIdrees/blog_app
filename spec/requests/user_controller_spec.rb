require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  context 'testing home route' do
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
end
