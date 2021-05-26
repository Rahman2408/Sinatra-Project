class SessionsController < ApplicationController

    
    get '/sessions/login' do 
        erb :"/sessions/login"
    end

    get '/sessions/login-e' do
        flash.now[:error]= "Hmmmm.. It looks like the credentials entered are invalid. Please check you spelled your Username or Password correctly or create an account to get started!"
        erb :"/sessions/login"
    end
    
    post '/sessions' do 
        user = User.find_by_username(params[:username])
        
       if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/users/home"
       else
        redirect "/sessions/login-e"
        end
    end

    get '/sessions/logout' do
        session.clear
        redirect "/"
    end
    
end