require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) { @event = FactoryBot.create(:event) }

  it "has a valid factory" do
    # Test de la factory
    expect(build(:event)).to be_valid
  end

  context "Validation" do
    
    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
    end

    describe "#start_date" do
      it {expect(@event).to validate_presence_of(:start_date)}
      it "has start date in the past" do
        @event.start_date = DateTime.now - 1
      expect(@event).not_to be_valid
      end
    end

    describe "#duration" do
      it {expect(@event).to validate_presence_of(:duration)}
      it "has wrong duration" do
        @event.duration = 0
        expect(@event).not_to be_valid
      end
      it "is not a multiple of 5" do
        @event.duration = 3
        expect(@event).not_to be_valid
      end
      it "has valid duration" do
        @event.duration = 5
        expect(@event).to be_valid
      end
    end

    describe "#title" do
      it {expect(@event).to validate_presence_of(:title)}
    end

    describe "#description" do
      it {expect(@event).to validate_presence_of(:description)}
    end

    describe "#price" do
      it {expect(@event).to validate_presence_of(:price)}
      it "cannot be a free event" do
        @event.price = 0
        expect(@event).not_to be_valid
      end
      it "is to expensive" do
        @event.price = 2000
        expect(@event).not_to be_valid
      end
    end

    describe "#location" do
      it {expect(@event).to validate_presence_of(:location)}
    end

  end

  context "Association" do
    it "should have attendances" do
      @attendee = FactoryBot.create(:user)
      @attendance = Attendance.create(attendee: @attendee, event: @event)
      expect(@event.attendances.include?(@attendance)).to eq(true)
    end 
  end
end
