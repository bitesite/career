module Career
  class TasksController < ApplicationController
    def index
      @tasks = Task.reverse_chronological
    end

    def show
      @task = Task.find params[:id]
    end
    
    
  end
end
