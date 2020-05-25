RSpec.describe User, type: :model do
  describe "assocations" do
    it { should have_many(:links) }
  end
end
