require 'rails_helper'

describe "Article test" do
  before do
    @article_service = ArticleService.new()
    create(:article, name:"Alpha") # id=1
    create(:article, name:"Beta") # id=2
    create(:author)
  end

  it 'should find valid article' do
    valid_article = @article_service.get_article(1)
    expect(valid_article).to be_valid
    expect(valid_article.name).to eq "Alpha"
  end

  it 'should find invalid article' do
    invalid_article = @article_service.get_article(3)
    expect(invalid_article).to be_nil
  end

  it 'should create new article' do
    author = Author.first
    num_articles = Article.count
    @article_service.create_article(author, {name: "Test", text: "Text text"})
    expect(Article.count).to eq num_articles + 1
  end

  it 'should update article' do
    article = Article.first
    @article_service.update_article(article, {name: "Alpha 1234"})
    expect(article.name).to eq "Alpha 1234"
  end

  it 'should destroy article' do
    article = Article.first
    num_articles = Article.count
    @article_service.destroy_article(article)
    expect(Article.count).to eq num_articles - 1
  end
end