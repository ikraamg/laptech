require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:teches) }
  it { should have_many(:favourites).dependent(:destroy) }
  it { should have_many(:favourite_teches).through(:favourites).
      source(:tech) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
