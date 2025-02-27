class GoalsController < ApplicationController
  before_action :require_login

  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.build(goal_params) 

    if @goal.save
      flash[:notice] = "目標を作成しました！" 
      redirect_to goals_path
    else
      flash.now[:alert] = "目標の作成に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :target_amount)
  end

end
