RSpec.describe Link, type: :model do
  subject(:link) { Link.new(title: title, url: url, content: content, user_id: user_id) }

  let(:title) { 'Some random title' }
  let(:url) { 'www.google.com' }
  let(:content) { nil }
  let!(:user) { create(:user) }
  let(:user_id) { user.id }

  it { expect(link).to be_valid }

  describe "#title" do
    context 'when is not present' do
      let(:title) { " " }

      it { expect(link).not_to be_valid }
    end

    context "when is too long" do
      let(:title) { 'a' * 51 }

      it { expect(link).not_to be_valid }
    end

    context "when is too short" do
      let(:title) { 'a' * 9 }

      it { expect(link).not_to be_valid}
    end
  end

  describe "#url" do
    context "when is not present" do
      let(:url) { " " }

      it { expect(link).not_to be_valid }
    end
  end
end
