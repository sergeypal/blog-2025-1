class CommentsController < ApplicationController
  # требуем авторизацию пользователя кроме списка и просмотра статей
  before_action :authenticate_user!

  # создание нового комментария
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.update(user: current_user)
    redirect_to article_path(@article)
  end

  # удаление комментария (пока без проверки привязки к автору)
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private

  # разрешённые параметры для сохранения/обновления
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
