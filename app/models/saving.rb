class Saving < ApplicationRecord
  belongs_to :user
  belongs_to :goal
end
