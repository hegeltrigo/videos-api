# spec/integration/jobs_spec.rb
require 'swagger_helper'

describe 'authentication API' do

  path '/api/v1/users/sign_in' do

    post 'login' do
      tags 'users'
      consumes 'application/json', 'application/xml'
      parameter name: :authentication, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            properties: {
              email: { type: :string },
              password: { type: :string }
            }
          }
        },
        required: []
      }

      response '201', 'authenticated' do
        let(:authentication) { { 'user[email]' => 'hegeltrigo@gmail.com', 'user[password]' => 'trabajosya123' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:authentication) { { 'user[email]' => 'hegeltrigo@gmail.com' } }
        run_test!
      end
    end

  end

  path '/api/v1/users/sign_out' do
    delete 'logout' do
      tags 'users'
      security [ bearer: [] ]
      consumes 'application/json', 'application/xml'
      
      response '201', 'authenticated' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

  end
end