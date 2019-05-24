class ScreenshotSerializer < ActiveModel::Serializer
  attributes :id, :original_url, :large_url, :image_id
  has_one :game
end
