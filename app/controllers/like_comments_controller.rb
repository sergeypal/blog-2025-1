class LikeCommentsController < ApplicationController
  # требуем авторизацию пользователя
  before_action :authenticate_user!

  # ставим лайк комментарию
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:comment_id])
    @like_comment = current_user.like_comments.create(comment: @comment)
    redirect_to @article, notice: 'Comment liked!'
  end

  # убираем лайк у комментария
  def destroy
    @like_comment = current_user.like_comments.find(params[:id])
    @comment = @like_comment.comment
    @like_comment.destroy
    redirect_to @comment.article, notice: 'Comment unliked!'
  end
end
