class UserSerializer < ActiveModel::Serializer
attributes :id, :username, :email, :image_url, :display_name, :bio, :tag_line
end
