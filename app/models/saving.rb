class Saving < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  
  TRANSACTION_TYPES = ["節約", "臨時収入"].freeze

  validates :transaction_type, inclusion: { in: TRANSACTION_TYPES }
  validates :amount, presence: true, numericality: { greater_than: 0 }

  after_save :update_goal_saved_amount
  after_destroy :update_goal_saved_amount
  
  private

  def update_goal_saved_amount
    goal.update_saved_amount
  end

end
