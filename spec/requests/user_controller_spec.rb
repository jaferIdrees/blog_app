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
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    before(:example) { get "/users/#{first_user.id}" }
    it 'Should rennder users show page' do
      expect(response).to render_template('show')
    end

    it 'Rendered page should include "Show selected user information"' do
      expect(response.body).to include(first_user.bio)
    end

    it 'http status to be OK' do
      expect(response).to have_http_status(:ok)
    end
  end
end
