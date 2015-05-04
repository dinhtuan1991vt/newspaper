class ArticleService
  def get_article(id)
    article = Article.find_by_id(id)
  end

  def create_article(author, params)
    article = author.articles.create(params)
  end

  def update_article(article, params)
    article.update_attributes(params)
  end

  def destroy_article(article)
    article.destroy
  end
end
