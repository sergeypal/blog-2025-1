class Article < ApplicationRecord
  # подключаем concerns/visible — общие методы со статусами статей (из мануала)
  include Visible

  # статья принадлежит пользователю (у статьи есть автор)
  belongs_to :user, optional: true
  # у статьи могут быть комментарии
  has_many :comments, dependent: :destroy

  # у статьи могут быть лайки
  has_many :like_articles, dependent: :destroy
  # у статьи могут быть лайкнувшие пользователи (связь через лайки)
  has_many :liking_users, through: :like_articles, source: :user

  # проверяем наличие заголовка
  validates :title, presence: true
  # проверяем наличие текста статьи (не менее 10 символов)
  validates :body, presence: true, length: { minimum: 10 }
end
