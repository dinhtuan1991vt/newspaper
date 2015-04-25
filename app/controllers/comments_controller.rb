class CommentsController < ApplicationController
  def create
    @id = params[:article_id]
    article = Article.find(@id)
    @comment = article.comments.create(text: params[:text])
  end
end

