class CommentService
  def create_comment(article, params)
    article.comments.create(text: params[:text])
  end
end