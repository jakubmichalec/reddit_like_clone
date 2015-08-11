require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  it "handles a missing link correctly" do
    get :show, id: 'not-here'

    expect(response).to redirect_to(links_path)

    message = "The link you looking for cannot be found"
    expect(flash["alert"]).to eq message
  end
end
