class SessionsController < ApplicationController
    # flash[:error]= "Hmmmm...Please check you spelled your Username or Password correctly!"
    # flash[:message]="SUCCESS! Logging you in.."
    
    get '/sessions/login' do 
        erb :"sessions/login"
    end

    get '/sessions/error' do 
        erb :"/sessions/login-error"
    end 
    
    post '/sessions' do 
        user = User.find_by_username(params[:username])
        
       if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        
        redirect "/users/home"
       else
        flash[:error]= "Hmmmm...Please check you spelled your Username or Password correctly!"
        end
    end

    get '/sessions/logout' do
        session.clear
        redirect "/"
    end
    
end