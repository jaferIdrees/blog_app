require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  describe "Blogs API" do
    path '/signup' do
      post 'Create a user'do
        tags 'Users'
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            email: { type: :email },
            password: { type: :string }
          },
          required: [ 'id', 'name', 'email', 'password' ]
        }

        response '200', 'Signed up sucessfully.' do
          let(:user) {{ name: 'test1', email: 'test@test.co'}}
          run_test!
        end

        response '422', 'invalid request' do
          let(:user) {{ name: 'test1' }}
          run_test!
        end
      end
    end
  end
end
