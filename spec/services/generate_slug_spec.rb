RSpec.describe GenerateSlug do
  subject { described_class.call }

  context "successfully generated" do
    it "based on the constant length" do
      expect(subject.size).to eql(GenerateSlug::SLUG_LENGTH)
    end

    # validate chars
  end

  context "failed generation" do
    it "when value already exists" do
      create(:link, slug: "abcd")

      expect(SecureRandom).to(
        receive(:alphanumeric)
          .exactly(GenerateSlug::MAX_ATTEMPT)
          .times
          .and_return("abcd")
      )

      expect(subject).to eql(nil)
    end
  end
end
