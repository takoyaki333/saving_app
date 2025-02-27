class SavingsController < ApplicationController
  before_action :set_goal
  
  def create
    @goal = Goal.find(params[:goal_id])
    @saving = @goal.savings.build(saving_params)

    if @saving.save
      redirect_to goal_path(@goal), notice: "節約記録を追加しました。"
    else
      Rails.logger.debug @saving.errors.full_messages
      render "goals/show", status: :unprocessable_entity
    end
  end

  private

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def saving_params
    params.require(:saving).permit(:transaction_type, :amount, :category, :reason).merge(goal_id: @goal.id, user_id: current_user.id)
  end

end
