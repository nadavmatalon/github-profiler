Rails.application.routes.draw do

    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" } 

    root to: 'static_pages#home'

    match '/home', to: 'static_pages#home', via: 'get'
    match '/about', to: 'static_pages#about', via: 'get'
    match '/contact', to: 'static_pages#contact', via: 'get'
    match '/help', to: 'static_pages#help', via: 'get'
    match '/profile', to: 'static_pages#profile', via: 'get'
    match '/github_profile', to: 'static_pages#github_profile', via: 'get'

    devise_scope :user do
        get "/sign_up" => "devise/registrations#new"
        get "/sign_in" => "devise/sessions#create"
        get "/sign_out" => "devise/sessions#destroy"
        get "/edit_account" => "devise/registrations#edit"
        get "/password_edit" => "devise/passwords#edit"
        get "/password_new" => "devise/passwords#new"
    end

    match "/create_gitlink/:user/:content", to: "gitlinks#create", via: "post"
    match '/saved_links', to: 'gitlinks#saved_links', via: 'get'

end
