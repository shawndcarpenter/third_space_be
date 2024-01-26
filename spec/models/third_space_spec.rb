require "rails_helper"

RSpec.describe ThirdSpace, type: :model do
  describe "relationships" do
    it { should have_many :user_third_spaces }
    it { should have_many :markers }
    it { should have_many(:users).through(:user_third_spaces) }
  end
end