require 'rails_helper'

RSpec.describe Tech, type: :model do
  it { should have_many(:favourites).dependent(:destroy) }
  it { should belong_to(:author).class_name('User').with_foreign_key(:user_id) }
  it {
    should have_many(:favourite_teches).through(:favourites)
      .source(:tech)
  }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:cost) }
end
