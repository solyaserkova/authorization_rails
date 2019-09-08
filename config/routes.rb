Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/index'
  root 'welcome#index'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout',registration: 'registrations', sign_up: 'cmon_let_me_in' }

  # devise_scope :user do
  #   match "/auth/register", to: "devise/registrations#create", via: :post
  #   match "/auth/register/cmon_let_me_in", to: "devise/registrations#new", via: :get
  # end
end
