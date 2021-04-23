module Career
  class TasksController < ApplicationController
    def index
      @tasks = Task.reverse_chronological
    end

    def show
      
    end
    
    
  end
end
