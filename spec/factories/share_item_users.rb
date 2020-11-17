FactoryBot.define do
  factory :share_item_user do
    task_id { create(:task) }
    user { create(:user) }
  end
end
