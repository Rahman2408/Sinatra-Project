class TasksController < ApplicationController
    get '/tasks' do
        @tasks = Task.all 
        erb :"/tasks/index"
    end

    get '/tasks/new' do
        erb :"/tasks/new"
    end

    post '/tasks' do 
        new_task = Task.create(name: params[:name], description: params[:description], notes: params[:notes])
        new_task.user_id = current_user.id
        redirect "/tasks/#{new_task.id}"
    end

    get '/tasks/:id/edit' do 
        @task = Task.find(params[:id])
        erb :"/tasks/edit"
    end

    patch '/tasks/:id/edit' do
        task = Task.find(params[:id])
        task.update(name: params[:name], description: params[:description], notes: params[:notes])
        redirect "/tasks/#{task.id}"
    end

    delete '/tasks/:id' do 
        task = Task.find(params[:id])
        task.delete 
        redirect "/tasks"
    end

    get '/tasks/:id' do
        @task = Task.find(params[:id])
        erb :"/tasks/show"
    end
end