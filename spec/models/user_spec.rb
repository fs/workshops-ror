require 'spec_helper'

describe(User) do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it "should have fullname method" do
    subject.should respond_to(:fullname)
  end

  describe '#fullname' do
    subject { User.new }

    it "should be Ruslan if only first name specified" do
      subject.first_name = 'Ruslan'
      subject.last_name = nil
      subject.fullname.should == 'Ruslan'
    end

    it "should be Ruslan Gatiyatov if everything was specified" do
      subject.first_name = 'Ruslan'
      subject.last_name = 'Gatiyatov'
      subject.fullname.should == 'Ruslan Gatiyatov'
    end

    it "should be Ruslan if only email specified" do
      subject.first_name = nil
      subject.last_name = nil
      subject.email = 'ruslan@test.com'
      subject.fullname.should == 'ruslan@test.com'
    end
  end

  describe "votes" do
    let(:votes) { [Vote.new] }

    subject { User.new }

    it "should return user votes" do
      subject.stubs(:votes).returns(votes)
      subject.votes.size.should == 1
    end
  end

  describe '#messages' do
    let(:good_message) { Message.new(body: 'you are good')}
    let(:bad_message) { Message.new(body: 'you are fool')}

    it "should ...." do
      subject.stubs(:messages).returns([good_message, bad_message])
      subject.check_messages.should == [bad_message]
    end

    it "should ..." do
      m = mock('messages')
      m.stubs(:count).returns(2)
      subject.stubs(:messages).returns(m)
      subject.messages.should == m
      subject.messages.count.should == 2
    end
  end

  describe 'fullname' do
    before do
      subject.first_name = 'R'
      subject.last_name = 'G'
    end

    its(:fullname) { should == 'R G' }
  end

end
