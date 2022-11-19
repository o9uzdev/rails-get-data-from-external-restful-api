Rails.application.routes.draw do
  get '/user/index/:page', to:'user#index', defaults: { page: '1'}
  get '/user/show/:id', to: 'user#show'
  get '/user/search', to:'user#search'
  root to: redirect(path: '/user/index/1')  
end