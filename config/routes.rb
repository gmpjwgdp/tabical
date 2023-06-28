Rails.application.routes.draw do
  get 'mypages/show'

  get 'maps/index'

  get 'root/index'
  get '/help' => 'root#help'
  post '/responses/:id' => 'responses#ba'
  post '/responses/mymap/:id' => 'responses#mymap'
  get '/responses/:id/edit/:post_id' => 'responses#edit'
  get '/posts/:id/responses/index' => 'responses#index'
  # get '/posts/:id'=> 'responses#index'
  # resources :responses
  resources :posts, except: :show 
  resources :responses, except: [:new ,:show]
  # get 'posts/index'

  # get 'posts/new'

  # post 'posts/create'

  # get 'responses/index'

  # get 'responses/create'

  # get 'post/index'

  # get 'post/new'

  # get 'post/create'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'root#index'
  
  # resources(:posts)
  # resources(:responses)
end
