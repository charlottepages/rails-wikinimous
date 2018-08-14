class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
    # displays the form
  end

  def create
    Article.create!(article_params)
    redirect_to articles_path
    # receives the form data and creates in db
  end

  def edit; end

  def update
    @article.update!(article_params)
    redirect_to article_path(@article.id)
  end

  def destroy
    @article.destroy!
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
