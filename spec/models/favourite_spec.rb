require 'rails_helper'

RSpec.describe Favourite, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:tech) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:tech_id) }
end
