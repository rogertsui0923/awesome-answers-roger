Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # you map a HTTP verb / URL combo to a controller + action (method)
  # get '/' => 'welcome#index'
  root 'welcome#index'
  # get({'/' => 'welcome#index'})

  # resources :dashboard, only: [:index], controller: 'admin/dashboard'
  namespace :admin do
    resources :dashboard, only: [:index]
  end

  # the above route maps any 'GET' request with '/' URL to the index action within the WelcomeController (action is a method defined within the controller class)
  # the above can be called DSL (Domain Specific Language). It's just Ruby it's not a special programming language, just Ruby. The Ruby is written in a way that looks like its own language
  get '/contact' => 'welcome#contact_us'
  post '/contact_submit' => 'welcome#contact_submit'
  get '/about' => 'welcome#about_us', as: :aboutus


  resources :questions do
    post :search, on: :collection
    # this creates a set of 'answers' routes nested within the 'questions' routes. This will make all the 'answers' routes
    resources :answers, only: [:create, :destroy]
  end


  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  # this line generates all routes below
  # post   '/questions'          => 'questions#create', as: :questions
  # get    '/questions'          => 'questions#index'
  # get    '/questions/new'      => 'questions#new',    as: :new_question
  # get    '/questions/:id'      => 'questions#show',   as: :question
  # get    '/questions/:id/edit' => 'questions#edit',   as: :edit_question
  # patch  '/questions/:id'      => 'questions#update'
  # delete '/questions/:id'      => 'questions#destroy'

  # post   '/questions/:question_id/answers' => 'answers#create'
  # delete '/questions/:question_id/answers/:id' => 'answers#destroy'
end
