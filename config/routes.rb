Rails.application.routes.draw do
  devise_for :users, path: "auth", path_names:{sign_in: 'login',sign_out: 'logout'}
    resources :todo_lists do
      resources :todo_items do
        member do
          patch :complete
          patch :priority
        end
    end
  end
  root "todo_lists#index"
end
