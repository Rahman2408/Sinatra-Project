class SessionsController < ApplicationController

    
    get '/sessions/login' do 
        erb :"/sessions/login"
    end

    post '/sessions' do 
        user = User.find_by_username(params[:username])
       if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/users/home"
       else
        flash[:errors]= "Invalid credentials"
        redirect "/sessions/login"
        end
    end

    get '/sessions/logout' do
        session.clear
        redirect "/"
    end
    
end