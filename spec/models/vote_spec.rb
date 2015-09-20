RSpec.describe Vote, type: :model do
  subject(:vote) { Vote.new(value: value, link_id: link_id , user_id: user_id) }
  let(:user) { create(:user) }
  let(:link) { create(:link, user: user) }
  let(:link_id) { link.id }
  let(:user_id) { user.id }

  let(:value) { 1 }

  it { expect(vote).to be_valid }

  describe "#vote" do
    context 'when value is not present' do
      let(:value) { '' }

      it { is_expected.to_not be_valid }
    end

    context 'when value is bigger than 1' do
      let(:value) { 2 }

      it { is_expected.to_not be_valid }
    end

    context "when value is lower than -1" do
      let(:value) { -10 }

      it { is_expected.to_not be_valid }
    end
  end

  describe "#user_id" do
    context 'when user_id is not present' do
      let(:user_id) { '' }

      it { is_expected.to_not be_valid }
    end
  end

  describe "#link_id" do
    let(:link_id) { '' }

    it { is_expected.to_not be_valid }
  end
end
