Rails.application.routes.draw do
  namespace :api do
    # menu                            
  
    get           'authors',                      to:'authors#index'       # all authors
    get           'authors/:id',                  to:'authors#show'        # one author
    post          'authors',                      to:'authors#create'      # create author
    put           'authors/:id',                  to:'authors#update'
    delete        'authors/:id',                  to:'authors#destroy'

    get           'authors/:author_id/books',     to:'books#index'
    post          'authors/:author_id/books',     to:'books#create'
    get           'authors/:author_id/books/:id', to:'books#show'
    delete        'authors/:author_id/books/:id', to:'books#destroy'
    put           'authors/:author_id/books/:id', to:'books#update'


end
end

#resources :authors
#resources :songs