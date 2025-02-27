class Goal < ApplicationRecord
  belongs_to :user
  has_many :savings, dependent: :destroy

  def update_saved_amount
    update(saved_amount: savings.sum(:amount))
  end
end
