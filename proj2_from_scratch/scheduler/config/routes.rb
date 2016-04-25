Rails.application.routes.draw do
  devise_for :students
  devise_for :admins
  root 'home#index'
  get '/login' => 'home#login', as: 'home_login'
  get '/signup' => 'home#signup', as: 'home_signup'
  get 'students/:id' => 'students#show', as: 'student_show'
  get 'admins/:id' => 'admins#show', as: 'admin_show'
  get "courses/new" => "courses#new", as: 'course_new'
  get "courses" => "courses#index", as: 'course_index'
  get "courses/show" => "courses#show", as: 'course_show'
  post "courses" => "courses#create"
  get "schedules/new" => "schedules#new", as: 'schedule_new'
  get "schedules/create" => "schedules#create", as: 'schedule_create'
  get "schedules" => "schedules#index", as: 'schedule_index'
  patch "schedules/:id/add_class" => "schedules#add_class", as: 'add_class'
  post "schedules" => "schedules#create"

  resources :courses do
    collection { post :import }
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
