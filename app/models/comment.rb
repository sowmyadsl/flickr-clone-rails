class Comment < ApplicationRecord
  belongs_to :image

  validates :author, :body, :presence => true

end
