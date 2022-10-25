require 'rails_helper'

RSpec.describe 'Posts controller', type: :request do
  context 'testing posts index route' do
    before(:example) { get '/users/:user_id/posts' }
    it 'Should rennder posts show page' do
      expect(response).to render_template('index')
    end

    it 'Rendered page should include "Here is a list of posts for a given user"' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end

    it 'http status to be OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'testing posts show route' do
    before(:example) { get '/users/:user_id/posts/:id' }
    it 'Should rennder posts show page' do
      expect(response).to render_template('show')
    end

    it 'Rendered page should include "Here is a given post for a given user"' do
      expect(response.body).to include('Here is a given post for a given user')
    end

    it 'http status to be OK' do
      expect(response).to have_http_status(:ok)
    end
  end
end
