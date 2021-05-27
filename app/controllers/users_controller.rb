class UsersController < ApplicationController

    get '/users/signup' do 
        erb :"users/signup"
    end

    post '/users' do
        user = User.create(params)
        if user.valid?
            session[:user_id] = user.id 
            redirect "/users/home" 
        else
            flash[:errors] = user.errors.full_messages.first
            redirect "/users/signup"
        end
    end
    
    get '/users/home' do 
        erb :"users/home"
    end
    
end