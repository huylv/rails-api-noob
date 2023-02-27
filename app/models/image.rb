class Image < ApplicationRecord
  has_one_base64_attached :image_file
end
