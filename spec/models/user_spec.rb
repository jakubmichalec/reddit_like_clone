RSpec.describe User, type: :model do
  subject(:user) { User.new(name: name, email: email, password: password,
                            password_confirmation: password_confirmation) }

  let(:name) { 'Joel' }
  let(:email) { 'joel@example.com' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }

  it { expect(user).to be_valid }

  describe "#name" do
    context "when #name is not present" do
      let(:name) { '' }

      it { expect(user).not_to be_valid }
    end

    context "when #name is too long" do
      let(:name) { 'a' * 51 }

      it { expect(user).not_to be_valid }
    end
  end

  describe '#email' do
    context 'when #email is not present' do
      let(:email) { " " }

      it { expect(user).not_to be_valid }
    end

    context "when #email is too long" do
      let(:email) { 'a' * 244 + '@example.com'}

      it { expect(user).not_to be_valid }
    end

    context 'when #email is in invalid format' do
      invalid_adress = %w[example@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]

      invalid_adress.each do |invalid|
        let(:email) { invalid }
        it { expect(user).not_to be_valid}
      end
    end

    context 'when #email is not unique' do
      let!(:first_user) { User.create!(name: 'Joey', email: 'joey@example.com', password: 'password')}
      let(:duplicate_user) { first_user.dup}

      it { expect(duplicate_user).not_to be_valid }
    end
  end

  describe '#password' do
    context "when #password is blank" do
      let(:password) { ' ' }

      it { expect(user).not_to be_valid }
    end
  end
end
