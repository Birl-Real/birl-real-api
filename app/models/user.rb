class User < ApplicationRecord
  include RailsAdmin::UserAdmin
  
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

include DeviseTokenAuth::Concerns::User

  has_many :group_memberships, dependent: :destroy
  has_many :challenge_group, through: :group_memberships
  has_many :posts, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }

  mount_uploader :avatar, AvatarUploader if defined?(AvatarUploader)

  def admin?
    admin
  end

  def role_in_group(group)
    group_memberships.find_by(group: group)&.role
  end

  def uid
    self.email
  end

  def provider
    'email'
  end
end 