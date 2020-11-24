Rails.application.routes.draw do
 
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'sign_in',
               sign_out: 'sign_out',
               registration: 'sign_up'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
             resources :articles do
              post "/articles" => "articles#create"
              end
          

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
