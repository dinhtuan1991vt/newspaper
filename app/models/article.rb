
class Article < ActiveRecord::Base
  paginates_per 5
  belongs_to :author
  has_many :comments, dependent: :nullify
  validates :name, length: { maximum: 255 }
  has_attached_file :image, :styles => { :large => "300x300#", :small => "150x150#", :avatar => "100x100#" }, :default_url => "", :convert_options => {:large => "-gravity center -extent 300x300", :small => "-gravity center -extent 150x150", :avatar => "-gravity center -extent 100x100"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 5.megabytes

  
  mount_uploader :video, VideoUploader
  validate :video_size

  def video_size
    if !video.file.nil? && video.file.size.to_f/(1000*1000) > 30
      errors.add(:video, "You cannot upload a file greater than 30MB")
    end
  end

  def image_url
    image.url(:large)
  end
end