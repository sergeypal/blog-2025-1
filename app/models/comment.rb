class Comment < ApplicationRecord
  include Visible

  belongs_to :user, optional: true
  belongs_to :article

  has_many :like_comments, dependent: :destroy
  has_many :liking_users, through: :like_comments, source: :user

  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
