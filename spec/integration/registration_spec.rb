# spec/integration/jobs_spec.rb
require 'swagger_helper'

describe 'authentication API' do

  path '/api/v1/users' do

    post 'signup' do
      tags 'users'
      consumes 'application/json', 'application/xml'
      parameter name: :signup, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            properties: {
              email: { type: :string },
              password: { type: :string },
              password_confirmation: { type: :string}
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

  
end