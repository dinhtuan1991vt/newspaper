require 'rails_helper'

describe "Author test" do
  before do
    @author_service = AuthorService.new()
    create(:author, name:"Alpha") # id=1
    create(:author, name:"Beta") # id=2
  end

  it 'should find valid author' do
    valid_author = @author_service.get_author(1)
    expect(valid_author).to be_valid
    expect(valid_author.name).to eq "Alpha"
  end

  it 'should find invalid author' do
    invalid_author = @author_service.get_author(3)
    expect(invalid_author).to be_nil
  end
end