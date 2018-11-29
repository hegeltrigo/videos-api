# spec/integration/videos_spec.rb
require 'swagger_helper'

describe 'videos API' do

  path '/api/v1/videos' do

    post 'Creates a video' do
      tags 'videos'
      security [ bearer: [] ]

      consumes 'application/json', 'application/xml'
      parameter name: :job, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          video_url: {type: :string}
        },
        required: [ 'title', 'description', 'video_url' ]
      }

      response '201', 'job created' do
        let(:job) { { title: 'Dodo', description: 'available', video_ur: 'http://www.youtube.com/watch?v=RCUkmUXMd_k' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:job) { { title: 'foo' } }
        run_test!
      end
    end

    get 'get all videos' do
      tags 'videos'
      consumes 'application/json', 'application/xml'
      # let(:"Authorization") { "Bearer #{token_for(user)}" }

      response '201', 'get all videos' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
  end


  path '/api/v1/videos/my_videos' do

    get 'get all  my videos' do
      tags 'videos'
      security [ bearer: [] ]
      consumes 'application/json', 'application/xml'
      # let(:"Authorization") { "Bearer #{token_for(user)}" }

      response '201', 'get all videos' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
  end



  path '/api/v1/videos/{id}' do

    get 'Retrieves a job' do
      tags 'videos'
      security [ bearer: [] ]
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer }
          },
          required: [ 'id' ]

        let(:id) { job.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
        run_test!
      end

      response '404', 'job not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/videos/{id}' do
    delete 'delete' do
      tags 'videos'
      security [ bearer: [] ]
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '201', 'deleted job' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

    put 'Updateds a job' do
      tags 'videos'
      security [ bearer: [] ]
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      parameter name: :job, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string }
        },
        required: [ 'title', 'description' ]
      }

      response '201', 'job updated' do
        let(:job) { {title: 'Dodo', description: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:job) { { title: 'foo' } }
        run_test!
      end
    end

  end
  

end