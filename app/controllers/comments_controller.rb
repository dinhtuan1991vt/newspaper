class CommentsController < ApplicationController
  def create
    @id = params[:article_id]
    article = ArticleService.new().get_article(@id)
    @comment = CommentService.new().create_comment(article, params)
    @num = article.comments.size.to_s
  end
end

