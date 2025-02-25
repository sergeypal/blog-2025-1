class Article < ApplicationRecord
  include Visible

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy

  has_many :like_articles, dependent: :destroy
  has_many :liking_users, through: :like_articles, source: :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
