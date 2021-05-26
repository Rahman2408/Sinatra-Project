class TasksController < ApplicationController
    get '/tasks' do
        @tasks = current_user.tasks
        erb :"/tasks/index"
    end

    get '/tasks/new' do
        erb :"/tasks/new"
    end

    post '/tasks' do 
        new_task = current_user.tasks.create(params[:task])
        redirect "/tasks/#{new_task.id}"
    end

    get '/tasks/:id/edit' do 
        @task = current_user.tasks.find(params[:id])
        erb :"/tasks/edit"
    end

    patch '/tasks/:id/edit' do
        task = current_user.tasks.find(params[:id])
        task.update(params[:task])
        redirect "/tasks/#{task.id}"
    end

    delete '/tasks/:id' do 
        task = current_user.tasks.find(params[:id])
        task.delete 
        redirect "/tasks"
    end

    get '/tasks/:id' do
        @task = current_user.tasks.find(params[:id])
        erb :"/tasks/show"
    end

    post '/tasks/destroy' do
        current_user.tasks.destroy_all
        redirect "/tasks"
    end
end