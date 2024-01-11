require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many :user_third_spaces }
    it { should have_many(:third_spaces).through(:user_third_spaces) }
  end
end