RSpec.describe RedirectController do
  describe "#redirection" do
    let(:user) { create(:user) }
    let!(:link) { create(:link, user: user, url: "https://www.google.com/") }

    context "when given correct slug" do
      subject { get :show, params: {path: link.slug} }

      it { expect(subject).to redirect_to(link.url) }
    end

    context "when given incorrect slug" do
      subject { get :show, params: {path: "invalid-slug"} }

      it { expect { subject }.to raise_error(ActionController::RoutingError) }
    end
  end
end
