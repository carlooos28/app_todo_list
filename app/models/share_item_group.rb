class ShareItemGroup < ApplicationRecord
  belongs_to :group
  belongs_to :task
end
