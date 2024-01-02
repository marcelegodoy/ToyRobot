Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :toy_robots, only: [:index]
  root 'toy_robots#index'
  post 'execute_command', to: 'toy_robots#execute_command'
end
