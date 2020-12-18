Rails.application.routes.draw do
  resources :categories
  
  resources :orders do
      
   resources:orderitems
    end  
  
  
  get '/profile' => 'static_pages#userprofile'
  
  
  
  devise_for :users do
      
      resources:orders
      
     end 
  
  get '/paid/:id' => 'static_pages#paid'
  
  get '/admin' => 'static_pages#adminsection'
  
  get '/checkout' => 'cart#createOrder'
  
  get '/done' => 'cart#done'
  
  get 'cart/index'
  
  
  

   resources :items
 root 'static_pages#home'
 
  post '/search' => 'static_pages#search'
   get '/help' => 'static_pages#help'

  get '/about' => 'static_pages#about'

   get '/contact' => 'static_pages#contact'
   
   get '/products' => 'items#index'
    
  get'/tocontact'  => 'static_pages#contact'
 
  get '/pretend_login' => 'user#pretendlogin'
  
  get '/pretend_logout' => 'user#pretendlogout'
  
  get '/cart' => 'cart#index'
  
  get '/cart/:id' => 'cart#add'
  
  get '/clearcart' => 'cart#clearcart'
  
  get '/remove/:id' => 'cart#remove'
  
  get '/decrease/:id' => 'cart#decrease'
  
  
  get '/upgrade/:id' => 'static_pages#upgrade'
  
  
   get '/downgrade/:id' => 'static_pages#downgrade'
  
  get '/alluser' => 'static_pages#alluser'
  
  get '/myorder' => 'static_pages#myorder'
  
   get '/sendmessage' => 'static_pages#sendmessage'
  
  
  
  #

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end
