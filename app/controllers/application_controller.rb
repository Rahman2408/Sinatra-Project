class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
    end

    get '/' do 
        puts "making sure conole is working"
        "just making sure we're online!!!"
    end
end