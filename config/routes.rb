Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'pages#home'
  get  'pages/tierlist', to: 'pages#tierlist'

  resources :articles

  get 'signup', to: 'users#new'
  resource :users, except:[:new]

end

