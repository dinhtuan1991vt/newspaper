class CommentsController < ApplicationController
  def create
    @id = params[:article_id]
    article = Article.find(@id)
    @comment = article.comments.create(text: params[:text])
    @num = article.comments.size.to_s
  end
end

