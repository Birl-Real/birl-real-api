class ChallengeGroup < ApplicationRecord
  # Associations
  has_many :group_memberships, dependent: :destroy
  has_many :users, through: :group_memberships
  has_many :posts, dependent: :destroy

  # Validations
  validates :name, presence: true
end
