require 'rails_helper'

RSpec.describe 'Posts controller', type: :request do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
  context 'testing posts index route' do
    before(:example) { get "/users/#{first_user.id}/posts" }
    it 'Should rennder posts show page' do
      expect(response).to render_template('index')
    end

    it 'Rendered page should include "Here is a list of posts for a given user"' do
      expect(response.body).to include(first_post.title)
    end

    it 'http status to be OK' do
      expect(response).to have_http_status(:ok)
    end
  end
  context 'testing posts index route' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    before(:example) { get "/users/#{first_user.id}/posts" }
    it 'Should rennder posts show page' do
      expect(response).to render_template('index')
    end

    it 'Rendered page should include "Here is a list of posts for a given user"' do
      expect(response.body).to include(first_post.text)
    end

    it 'http status to be OK' do
      expect(response).to have_http_status(:ok)
    end
  end
end
