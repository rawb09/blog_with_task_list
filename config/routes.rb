Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  get 'welcome/index'
  get 'todos/index'
root 'welcome#index'
  resources :posts
  resources :todos do
    member do
      patch :complete, :uncomplete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# Rails.application.routes.draw do
#   root to: "posts#index"
#   resources :posts
# end
