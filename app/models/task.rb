class Task < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :status, presence: true
  validates :type_share_item, presence: true

  enum status: [:pending, :doing, :completed]
  enum type_share_item: [:not_shared, :item_group, :item_user]

end
