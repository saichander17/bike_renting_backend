Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "v1/orders/", :module => "api/v1", :format => :json do
  	post 'create', to: 'orders#create'
  	# get 'index', to: 'orders#index'
  	get 'show/:id', to: 'orders#show'
  end
  scope "v1/bikes/", :module => "api/v1", :format => :json do
  	get 'available-bikes', to: 'bikes#fetch_available_bikes'
  end
end
