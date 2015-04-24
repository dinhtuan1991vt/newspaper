class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  end

  def create
    author_id = params[:article][:author_id]
    if !author_id.empty?
      author = Author.find(author_id)
      article = author.articles.create(params.require(:article).permit(:name, :text))
    end
    redirect_to article
  end

  def show
    @article = Article.find(params[:id])
  end
end