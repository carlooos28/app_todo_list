require 'rails_helper'

RSpec.describe User, type: :model do
  it "Validate presence of required fields" do
    should validate_presence_of(:email)
  end
end
