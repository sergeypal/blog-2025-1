class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :like_articles, dependent: :destroy
  has_many :liked_articles, through: :like_articles, source: :article

  has_many :like_comments, dependent: :destroy
  has_many :liked_comments, through: :like_comments, source: :comment

  def to_s
    email
  end
end
