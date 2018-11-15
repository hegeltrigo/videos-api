Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, as: nil do
    namespace :v1, as: nil do
      devise_for :users,
                #  path: '', 
                 controllers: {
                     :registrations => "api/v1/registrations",
                     :sessions => "api/v1/sessions"
                 }
      resources :jobs
    end
  end
end
