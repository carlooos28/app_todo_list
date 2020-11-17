require 'rails_helper'

RSpec.describe Task, type: :model do
  it "Validate presence of required fields" do
    should validate_presence_of(:name)
    should validate_presence_of(:status)
    should validate_presence_of(:type_share_item)
  end
end
