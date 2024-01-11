require "rails_helper"

RSpec.describe UserThirdSpace, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :third_space }
  end
end