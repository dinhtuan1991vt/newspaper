class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments, dependent: :nullify
  validates :name, length: { maximum: 255 }
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ""
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

  def avatar_url
      avatar.url(:thumb)
  end
end