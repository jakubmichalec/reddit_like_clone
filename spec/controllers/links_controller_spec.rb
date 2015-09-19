RSpec.describe LinksController, type: :controller do
  let(:link) { create(:link, user_id: user.id) }
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }


  context "when user visit not exisitng link" do
    it "handles a missing link correctly" do
      get :show, id: 'not-here'

      expect(response).to redirect_to(links_path)

      message = "The link you looking for cannot be found"
      expect(flash["alert"]).to eq message
    end
  end

  context "#edit" do
    it "when user is not logged in, redirect to login page" do
      get :edit, id: link
      expect(response).to redirect_to login_path
    end
  end

  context "#update" do
    it "when user is not logged in, redirect to login page" do
      patch :update, id: link, link: link
      expect(response).to redirect_to(login_path)
    end
  end
end
