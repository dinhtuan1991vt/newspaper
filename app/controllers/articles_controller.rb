class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @test = "Hello"
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