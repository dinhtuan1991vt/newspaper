class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments, dependent: :nullify
  validates :name, length: { maximum: 255 }
end