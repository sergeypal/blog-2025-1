class LikeArticlesController < ApplicationController
  # требуем авторизацию пользователя
  before_action :authenticate_user!

  # ставим лайк статье
  def create
    @article = Article.find(params[:article_id])
    @like_article = current_user.like_articles.create(article: @article)
    redirect_to @article, notice: 'Article liked!'
  end

  # убираем лайк у статьи
  def destroy
    @like_article = current_user.like_articles.find(params[:id])
    @article = @like_article.article
    @like_article.destroy
    redirect_to @article, notice: 'Article unliked!'
  end
end
