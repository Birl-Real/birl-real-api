class GroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :challenge_group

  # Validations
  validates :role, presence: true
  validates :user_id, uniqueness: { scope: :challenge_group_id }

  # Enums
  enum role: { member: 0, admin: 1 }
end
