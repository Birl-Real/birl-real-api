class Post < ApplicationRecord
  belongs_to :user
  belongs_to :challenge_group
  
  validates :content, presence: true
end
