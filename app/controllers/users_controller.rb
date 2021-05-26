class UsersController < ApplicationController

    get '/users/signup' do 
        erb :"users/signup"
    end

    post '/users' do
        user = User.create(params)
        session[:user_id] = user.id 
        redirect "/users/home" 
    end

    get '/users/home' do 
        erb :"/users/home"
    end
end