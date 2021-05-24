class UsersController < ApplicationController

    get '/users/signup' do 
        erb :"users/signup"
    end

    post '/users' do
        binding.pry
        user = User.create(params)
        session[:user_id] = user.id 
        redirect "/"
        
    end
end