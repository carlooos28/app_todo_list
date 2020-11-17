require 'rails_helper'

RSpec.describe Group, type: :model do
  it "Validate presence of required fields" do
    should validate_presence_of(:name)
  end
end
