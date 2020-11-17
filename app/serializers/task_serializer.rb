class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :initial_date, :final_date, :status, :type_share_item
  has_one :user

  def user
    user = self.object.user
    {
        id: user.id,
        email: user.email
    }
  end
end
