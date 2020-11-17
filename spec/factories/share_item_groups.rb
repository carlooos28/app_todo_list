FactoryBot.define do
  factory :share_item_group do
    group_id { create(:group) }
    task_id { create(:task) }
  end
end
