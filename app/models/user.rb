class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :goals
  has_many :savings

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
end
