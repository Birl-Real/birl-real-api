class GroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :challenge_group

  # Validations
  validates :role, presence: true
  validates :user_id, uniqueness: { scope: :challenge_group_id }

  # Enums
  ROLES = %w[admin member].freeze
  validates :role, inclusion: { in: ROLES }
end
