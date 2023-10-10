class WeeklyGoalsController < ApplicationController
  before_action :set_weekly_goal,   only: %i[ show edit update  ]
  before_action :find_current_user, only: %i[ create destroy  ]

  # GET /weekly_goals or /weekly_goals.json
  def index
    @weekly_goals = WeeklyGoal.all
  end

  # GET /weekly_goals/1 or /weekly_goals/1.json
  def show
  end

  # GET /weekly_goals/new
  def new
    @weekly_goal = WeeklyGoal.new
    
  end

  # GET /weekly_goals/1/edit
  def edit
  end

  # POST /weekly_goals or /weekly_goals.json
  def create
    
    @weekly_goal = WeeklyGoal.new(weekly_goal_params)
    respond_to do |format|
      if @weekly_goal.save
        format.html { redirect_to my_goal_monthly_goal_path(@user) , notice: "Weekly goal was successfully created." }
        format.js { redirect_to my_goal_monthly_goal_path(@user) , status: :created }
      else
        # format.html { redirect_to  my_goal_monthly_goal_path(@user) , status: :unprocessable_entity }
        format.js { render :errors, status: :unprocessable_entity }
      end
      # byebug
    end
  

  end

  # PATCH/PUT /weekly_goals/1 or /weekly_goals/1.json
  def update
    respond_to do |format|
      if @weekly_goal.update(weekly_goal_params)
        format.html { redirect_to weekly_goal_url(@weekly_goal), notice: "Weekly goal was successfully updated." }
        format.json {redirect_to weekly_goal_url(@weekly_goal) , status: :ok, location: @weekly_goal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weekly_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_goals/1 or /weekly_goals/1.json
  def destroy
    weekly_goals = @user.weekly_goals
    weekly_goals.each do |weekly_goal|
      weekly_goal.destroy
    end
    respond_to do |format|
        format.html { redirect_to my_goal_monthly_goal_path(@user) , notice: "Weekly goal was successfully destroyed." }
        format.json { head :no_content }
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly_goal
      @weekly_goal = WeeklyGoal.find(params[:id])
    end

    def find_current_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weekly_goal_params
      params.require(:weekly_goal).permit(:weekly_goal, :start_time, :user_id, :monthly_goal_id)
    end
end
