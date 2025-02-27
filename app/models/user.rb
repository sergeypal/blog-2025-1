class User < ApplicationRecord
  # devise — механизм аутентикации пользователя
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # у пользователя могут быть статьи
  has_many :articles, dependent: :destroy
  # у пользователя могут быть комментарии
  has_many :comments, dependent: :destroy

  # у пользователя могут быть лайки к статьями
  has_many :like_articles, dependent: :destroy
  # у пользователя могут быть лайкнутые статьи (через лайки к статьями)
  has_many :liked_articles, through: :like_articles, source: :article

  # у пользователя могут быть лайки к комментариям
  has_many :like_comments, dependent: :destroy
  # у пользователя могут быть лайкнутые комментарии (через лайки к комментариям)
  has_many :liked_comments, through: :like_comments, source: :comment

  def to_s
    email
  end
end
