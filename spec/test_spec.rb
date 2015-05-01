require 'rails_helper'

describe "Author test" do
  it 'should create new author' do
    expect{@author=create(:author)}.to change{Author.count}.by(1)
  end
end