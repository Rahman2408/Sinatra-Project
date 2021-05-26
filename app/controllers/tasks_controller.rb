class TasksController < ApplicationController
    get '/tasks' do
        @tasks = Task.all.where(user_id: current_user.id)
        erb :"/tasks/index"
    end

    get '/tasks/new' do
        erb :"/tasks/new"
    end

    post '/tasks' do 
        new_task = Task.create(params[:task])
        new_task.user_id = current_user.id
        new_task.save
        redirect "/tasks/#{new_task.id}"
    end

    get '/tasks/:id/edit' do 
        @task = Task.find(params[:id])
        erb :"/tasks/edit"
    end

    patch '/tasks/:id/edit' do
        task = Task.find(params[:id])
        task.update(params[:task])
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

    post '/tasks/destroy' do
        @tasks = Task.all.where(user_id: current_user.id)
        @tasks.destroy_all
        redirect "/tasks"
    end
end