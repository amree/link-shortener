RSpec.describe Link, type: :model do
  describe "assocations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:url) }
    it { is_expected.to validate_url_of(:url) }

    it "failed with invalid slug format" do
      link = build(:link, slug: "invalid slug")
      link.save

      expect(link.errors[:slug]).to eql(["is not in valid format"])
    end

    it "failed with slug same as application path" do
      link = build(:link, slug: "links")
      link.save

      expect(link.errors[:slug]).to eql(["has already been taken"])
    end
  end

  describe "hooks" do
    context "slug" do
      it "should have a slug when slug was not provided" do
        link = create(:link, slug: nil)

        expect(link.slug).to_not be_nil
      end

      it "should use given slug" do
        link = create(:link, slug: "custom-slug")

        expect(link.slug).to eql("custom-slug")
      end

      it "returns error when failed to generate unique slug" do
        expect(GenerateSlug).to receive(:call).and_return(nil)

        link = build(:link, slug: nil)
        link.save

        expect(link.errors[:slug])
          .to eql(["unique generation failed. Please try submitting again."])
      end

      it "doesn't set slug when there're other errors" do
        expect(GenerateSlug).to_not receive(:call)

        link = build(:link, url: nil)
        link.save

        expect(link.errors[:slug]).to eql([])
        expect(link.errors[:url]).to_not be_nil
      end

      context "caching" do
        let(:cache) { Rails.cache }

        it "should cache the slug" do
          link = create(:link)

          current_cache = cache.read "slug-#{link.slug}"

          expect(current_cache[:id]).to eql(link.id)
          expect(current_cache[:url]).to eql(link.url)
        end

        it "should delete previous slug if available" do
          link = create(:link, slug: "before")
          link.update(slug: "after")

          expect(cache.exist?("slug-after"))
          expect(!cache.exist?("slug-before"))
        end

        it "should remove cache when destroy" do
          link = create(:link, slug: "myslug")

          expect(cache.exist?("slug-myslug"))

          link.destroy

          expect(!cache.exist?("slug-myslug"))
        end
      end
    end
  end
end
