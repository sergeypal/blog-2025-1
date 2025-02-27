class ArticlesController < ApplicationController

  # требуем авторизацию пользователя кроме списка и просмотра статей
  before_action :authenticate_user!, except: %i(index show)

  # список статей на главной
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  # просмотр конкретной статьи
  def show
    @article = Article.find(params[:id])
  end

  # страница создания новой статьи
  def new
    @article = Article.new
  end

  # создание новой статьи
  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # страница редактирования существующей статьи
  def edit
    @article = Article.find(params[:id])
  end

  # обновление существующей статьи
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # удаление существующей статьи (пока без проверки привязки к автору)
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  # разрешённые параметры для сохранения/обновления
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
