class LikeComment < ApplicationRecord
  # лайк принадлежит пользователю (у лайка есть автор)
  belongs_to :user
  # лайк принадлежит статье
  belongs_to :comment
end
