class TasksController < ApplicationController
    get '/tasks' do
        @tasks = Task.all 
        erb :"/tasks/index"
    end

    

    get '/tasks/:id' do
        @task = Task.find(params[:id])
        erb :"/tasks/show"
    end
end