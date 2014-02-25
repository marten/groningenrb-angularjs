class MicropostSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :deletable
  has_one :user

  def deletable
    scope == object.user
  end
end