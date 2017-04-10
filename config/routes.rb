Rails.application.routes.draw do
  get 'online_lending/register'

  get 'online_lending/login'

  get 'online_lending/borrower'

  get 'online_lending/lender'

  root'lenders#index'
  get 'borrowers/index'

  post 'borrowers/create'=> 'borrowers#create'
  
  get 'sessions/create'
  post 'sessions'=>'sessions#create'
  # get 'sessions/borrower'
  # post'sessions'=>'sessions#borrower'
  get 'lenders/update'
  post 'lenders/update'=>'lenders#update'
  get 'histories/create'
  post'histories/create'=>'histories#create'
  
  
  get 'lenders/destroy'
  post'lenders/destroy'=> 'lenders#destory'

  get 'logins/index'
  get 'lenders/main'
  get 'lenders/index'
  

  post 'lenders/create'=> 'lenders#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
