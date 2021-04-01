require 'user'

describe User do
  describe '.create' do
    it 'creates new user in database, and return the User object' do
      user = User.create('test1@email.com', 'test1_password', 'test1_name', 'test1_username')
      expect(user.username).to eq 'test1_username'
    end
  end

  describe '.sign_in' do
    before (:each) { user = User.create('test2@email.com', 'test2_password', 'test2_name', 'test2_username') }
    context 'sign in with wrong email not existing in database' do
      it { expect(User.sign_in('nonexisting@email.com', 'test2_password')).to be_nil }
    end

    context 'sign in with wrong password' do
      it { expect(User.sign_in('test2@email.com', 'wrong_password')).to be_nil }
    end

    context 'sign in with correct info' do
      it 'sign in successfully' do
        user = User.sign_in('test2@email.com', 'test2_password')
        expect(user.username).to eq 'test2_username'
      end
    end
  end

end
