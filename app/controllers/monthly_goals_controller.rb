class MonthlyGoalsController < ApplicationController
  before_action :set_monthly_goal, only: %i[ show edit update destroy ]
 
 

  def index

  end
  # GET /monthly_goals or /monthly_goals.json
  def my_goal
    @user = User.find(params[:id])
    @monthly_goal = @user.monthly_goal
    @days_until_achievement = @monthly_goal.calc_days(@monthly_goal.goal_achieved_at)
    @weekly_goals = @user.weekly_goals
    @events = @user.collect_user_events(@weekly_goals)
    @task = Task.new

  end

  # GET /monthly_goals/1 or /monthly_goals/1.json
  def show
  end

  # GET /monthly_goals/new
  def new
    @monthly_goal = MonthlyGoal.new
  end

  # GET /monthly_goals/1/edit
  def edit
  end

  # POST /monthly_goals or /monthly_goals.json
  def create
    @current_user = current_user
    @monthly_goal = @current_user.build_monthly_goal(monthly_goal_params)

    respond_to do |format|
      if @monthly_goal.save
        format.html { redirect_to my_goal_monthly_goal_url(@monthly_goal), notice: "Monthly goal was successfully created." }
        format.json { render :show, status: :created, location: @monthly_goal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @monthly_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_goals/1 or /monthly_goals/1.json
  def update
    respond_to do |format|
      if @monthly_goal.update(judge_params)

        format.html { redirect_to  my_goal_monthly_goal_url(@monthly_goal), notice: "Monthly goal was successfully updated." }

        format.json { render :show, status: :ok, location: @monthly_goal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @monthly_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_goals/1 or /monthly_goals/1.json
  def destroy
    @monthly_goal.destroy

    respond_to do |format|
      format.html { redirect_to monthly_goals_url, notice: "Monthly goal was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_goal
      @monthly_goal = MonthlyGoal.find(params[:id])
    end

   

    # Only allow a list of trusted parameters through.
    def monthly_goal_params
      params.require(:monthly_goal).permit(:monthly_goal, :goal_achieved_at, :penalty_name, :image)
    end

    def only_monthly_goal_params
      params.require(:monthly_goal).permit(:monthly_goal)
    end

    def only_penalty_name_params
      params.require(:monthly_goal).permit(:penalty_name)
    end

    def only_penalty_image_params
      params.require(:monthly_goal).permit(:image)
    end

    def params_include_monthly_achieved_at_and_monthly_goal?
      params[:monthly_goal].key?(:goal_achieved_at) && params[:monthly_goal].key?(:monthly_goal)
    end

    def params_include_only_monthly_goal?
      params[:monthly_goal].key?(:monthly_goal) 
    end

    def  params_include_only_penalty_goal?
      params[:monthly_goal].key?(:penalty_name) 
    end

    def params_include_only_image?
      params[:monthly_goal].key?(:image)
    end

    def judge_params
        if params_include_monthly_achieved_at_and_monthly_goal?
           monthly_goal_params  # 存在する場合はmonthly_goal_paramsを返す
        elsif params_include_only_monthly_goal?
           only_monthly_goal_params
        elsif params_include_only_penalty_goal?
           only_penalty_name_params
        elsif params_include_only_image?
           only_penalty_image_params
        end
    end

end
