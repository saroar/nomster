class Photo < ActiveRecord::Base
  belongs_to :place
  belongs_to :user

  mount_uploader :picture, PictureUploader
  validates :caption, :presence => true, :length => { :minimum => 3, :maximum => 24 }
  validates :picture, :presence => true
end
