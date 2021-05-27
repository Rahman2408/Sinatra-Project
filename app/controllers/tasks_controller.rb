class TasksController < ApplicationController
    get '/tasks' do
        @tasks = current_user.tasks.where(completed: false)
        @completed_tasks = current_user.tasks.where(completed: true)
        erb :"/tasks/index"
    end

    get '/tasks/new' do
        erb :"/tasks/new"
    end

    post '/tasks' do 
        new_task = current_user.tasks.create(params[:task])
        redirect "/tasks"
    end

    get '/tasks/:id/edit' do 
        @task = current_user.tasks.find(params[:id])
        erb :"/tasks/edit"
    end

    patch '/tasks/:id/edit' do
        task = current_user.tasks.find(params[:id])
        task.update(params[:task])
        task.update(completed: false)
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
    
    post '/tasks/:id/completed' do
        task = current_user.tasks.find(params[:id])
        task.update(completed: true)
        redirect "/tasks"
    end

    post '/tasks/clear-complete' do
        completed_tasks = current_user.tasks.where(completed: true)
        completed_tasks.destroy_all
        redirect '/tasks'
    end

    post '/tasks/destroy' do
        current_user.tasks.destroy_all
        redirect "/tasks"
    end
end