class CommentsController < ApplicationController
  def create
    @id = params[:article_id]
    article = ArticleService.new().get_article(@id)
    @comment = CommentService.new().create_comment(article, params)
    @num = t('articles.index.comment', :count => article.comments.count)
  end
end

