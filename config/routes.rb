Rails.application.routes.draw do
	root 'pages#home'
# get home and send it somewhere
# pages controller and home action in pages controller
  get '/home', to: 'pages#home'
  
end
