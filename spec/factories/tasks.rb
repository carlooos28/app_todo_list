FactoryBot.define do

  factory :task do
    name { "Task " }
    description { "Completar la tarea" }
    initial_date { "2020-11-17" }
    final_date { "2020-11-17" }
    status { :doing }
    type_share_item { :item_group }
    user { create(:user) }
  end
end
