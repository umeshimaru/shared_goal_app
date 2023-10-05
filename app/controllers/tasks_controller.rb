class TasksController < ApplicationController
  def new
    
  end

  def create
    @task =Task.new(task_params)
    @current_user = current_user
    respond_to do |format|
      if @task.save
        format.js {redirect_to my_goal_monthly_goal_path(@current_user),notice: "task was successfully created."}
      else
        format.js {render :task_errors,status: :unprocessable_entity }
        
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def task_params
    params.require(:task).permit(:task,:start_time,:end_time,:weekly_goal_id)
  end
end
