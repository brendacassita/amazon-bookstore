Rails.application.routes.draw do
  namespace :api do
    # menu                            
  
    get           'authors',                      to:'authors#index'       # all authors
    get           'authors/:id',                  to:'authors#show'        # one author
    post          'authors',                      to:'authors#create'      # create author
    put           'authors/:id',                  to:'authors#update'
    delete        'authors/:id',                  to:'authors#destroy'

end
