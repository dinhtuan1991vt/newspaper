
class Article < ActiveRecord::Base
  paginates_per 5
  belongs_to :author
  has_many :comments, dependent: :nullify
  validates :name, length: { maximum: 255 }
  has_attached_file :image, :styles => { :large => "300x300>", :small => "150x150#", :avatar => "100x100#" }, :default_url => "", :convert_options => {:large => "-gravity center -extent 300x300", :small => "-gravity center -extent 150x150", :avatar => "-gravity center -extent 100x100"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 5.megabytes


  has_attached_file :video, :styles => {
    :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 1 }
  }, :default_url => "", :processors => [:transcoder]
  validates_attachment_content_type :video, :content_type => ["video/mp4", "video/x-flv", "video/avi"]
  validates_attachment_file_name :video, :matches => [/mp4\Z/, /flv\Z/, /avi\Z/]
  validates_with AttachmentSizeValidator, :attributes => :video, :less_than => 30.megabytes

  def image_url
    image.url(:large)
  end

  def video_thumb_url
    video.url(:thumb)
  end 
end