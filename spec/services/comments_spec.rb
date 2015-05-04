require 'rails_helper'

describe "Comment test" do
  before do
    @comment_service = CommentService.new()
    create(:article, name:"Alpha")
    create(:article, name:"Beta")
  end

  it 'should create new comment' do
    article = Article.first
    num_comments = Comment.count
    @comment_service.create_comment(article, {text: "Text text"})
    expect(Comment.count).to eq num_comments + 1
    expect(article.comments.count).to eq num_comments + 1
    expect(Comment.first.text).to eq "Text text"
  end
end