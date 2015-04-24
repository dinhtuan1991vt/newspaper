class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    comment = article.comments.create(text: params[:text])
    redirect_to article
  end
end
  	
