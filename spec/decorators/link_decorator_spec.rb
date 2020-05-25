RSpec.describe LinkDecorator do
  let(:title) { nil }
  let(:link) { create(:link, title: title).extend LinkDecorator }

  subject { link }

  it { should be_a Link }

  describe "#current_title" do
    context "when title blank" do
      let(:title) { nil }

      it { expect(link.current_title).to eql(link.url) }
    end

    context "when title is not blank" do
      let(:title) { "a webpage title" }

      it { expect(link.current_title).to eql("a webpage title") }
    end
  end

  describe "#slug_with_url" do
    context "port 80" do
      module MockRequest1
        def request
          OpenStruct.new(
            scheme: "http",
            host: "domain.com",
            port: 80
          )
        end
      end

      before { link.extend(MockRequest1) }

      it { expect(link.slug_with_url).to eql("http://domain.com/#{link.slug}") }
    end

    context "port 443" do
      module MockRequest2
        def request
          OpenStruct.new(
            scheme: "https",
            host: "domain.com",
            port: 443
          )
        end
      end

      before { link.extend(MockRequest2) }

      it { expect(link.slug_with_url).to eql("https://domain.com/#{link.slug}") }
    end

    context "port different than 80 or 443" do
      module MockRequest3
        def request
          OpenStruct.new(
            scheme: "http",
            host: "domain.com",
            port: 3000
          )
        end
      end

      before { link.extend(MockRequest3) }

      it { expect(link.slug_with_url).to eql("http://domain.com:3000/#{link.slug}") }
    end
  end
end
