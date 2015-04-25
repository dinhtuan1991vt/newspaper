class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @article = Article.new
  end

  def new
    @article = Article.new
  end

  def create
    author = Author.find(params[:article][:author_id])
    @article = author.articles.create(params.require(:article).permit(:name, :text))

    respond_to do |format|
      format.js   {}
      format.json { render json: @article }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update_attributes(params.require(:article).permit(:name, :text))

    redirect_to action: "index"
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def destroy
     @article = Article.find(params[:id])
     @article.destroy

     redirect_to action: "index"
  end
end