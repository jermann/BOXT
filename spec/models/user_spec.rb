require 'rails_helper'

RSpec.describe User do


describe 'User tests' do
  before(:each) do
    @u1 = User.create!(name: 'Harry Potter', email: 'harry.potter1@example.com', password: 'wizard123')
  end

  it 'should show listings for the user' do
    @u1.listing
    expect(@u1.listings).to eq([])
  end

  it 'should work for nil bookings' do
    @u1.bookings = nil
    @u1.new_booking(1, 15)
    expect(@u1.bookings).to eq([{"storage_id" => 1, "booked_space" => 15, "rating" => nil}])
  end

end

end