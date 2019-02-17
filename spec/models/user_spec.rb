require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) { @user = FactoryBot.create(:user) }

  it "has a valid factory" do
    # Test de la factory
    expect(build(:user)).to be_valid
  end

  context "Validation" do
    
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#first_name" do
      it {expect(@user).to validate_presence_of(:first_name)}
    end

    describe "#last_name" do
      it {expect(@user).to validate_presence_of(:last_name)}
    end

    describe "#email" do
      it {expect(@user).to validate_presence_of(:email)}
      it "should have an email format" do
        @user.email = "wrong_email_format"
        expect(@user).not_to be_valid
      end
    end

  end

  context "Association" do
    it "should have attendances" do
      @event = FactoryBot.create(:event)
      @attendance = Attendance.create(attendee: @user, event: @event)
      expect(@attendance.attendee.id == @user.id).to eq(true)
    end 
  end
end

