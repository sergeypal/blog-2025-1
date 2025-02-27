class Comment < ApplicationRecord
  # подключаем concerns/visible — общие методы со статусами статей (из мануала)
  include Visible

  # комментарий принадлежит пользователю (у комментария есть автор)
  belongs_to :user, optional: true
  # комментарий также принадлежит статье (он не может быть без статьи!)
  belongs_to :article

  # у комментария могут быть лайки
  has_many :like_comments, dependent: :destroy
  # у комментария могут быть лайкнувшие пользователи (связь через лайки)
  has_many :liking_users, through: :like_comments, source: :user

  # проверяем наличие автора комментария
  validates :commenter, presence: true
  # проверяем наличие текста комментария (не менее 10 символов)
  validates :body, presence: true, length: { minimum: 10 }
end
