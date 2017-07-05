class Image < ApplicationRecord
  belongs_to :user
  validates :title, :image_url, :user_id, :presence => true

end
