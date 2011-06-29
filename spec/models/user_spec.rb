require 'spec_helper'

describe User do
  let(:h) do
    [ {'email' =>"foo@bar.com", 'password' => "first test"},
      {'email' =>"another@mail.com", 'password' => "second test"},
      {'email' =>"more@addresses.com", 'password' => "forth test"}]
  end
  before(:each) do
    h.each do |e|
      User.create e
    end
  end
  context '#save' do
    it 'should be invalid if a user with the same email already exist' do
      user = User.build({'email' => "foo@bar.com", 'password' => 'secret'})
      user.save.should be_nil
    end
  end
  context '#find_by' do
    it 'should find users based on the email' do
      user = User.find_by :email, 'foo@bar.com'
      user.email.should eq('foo@bar.com')
    end

    it 'should let me authenticate with a password' do
      user = User.find_by :email, 'foo@bar.com'
      user.authenticate('first test').should be_true
    end

    it 'should not let me authenticate with a wrong password' do
      user = User.find_by :email, 'foo@bar.com'
      user.authenticate('second test').should be_false
    end
  end
end
