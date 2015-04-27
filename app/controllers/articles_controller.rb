class ArticlesController < ApplicationController
  before_action :get_article, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_author!
  def index
    @articles = Article.all
    @article = Article.new
  end

  def new
    @article = Article.new
  end

  def create
    author = Author.find(params[:article][:author_id])
    @article = author.articles.create(article_params)
  end

  def edit

  end

  def update
    @article.update_attributes(article_params)
    @id = params[:id]
  end

  def show
    @comments = @article.comments
  end

  def destroy
    @id = params[:id]
    @article.destroy
  end

  private
    def article_params
      params.require(:article).permit(:name, :text)
    end

    def get_article
      @article = Article.find(params[:id])
    end
end