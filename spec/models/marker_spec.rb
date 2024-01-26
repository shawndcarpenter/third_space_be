require "rails_helper"

RSpec.describe Marker, type: :model do
  describe "relationships" do
    it { should belong_to :third_space }
  end
end