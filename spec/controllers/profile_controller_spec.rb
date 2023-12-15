require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

include Devise::Test::ControllerHelpers

before(:each) do
  u1 = User.create!(name: 'Harry Potter', email: 'harry.potterp@example.com', password: 'wizard123')
  @u1 = u1
  sign_in @u1
end

describe 'show' do
  it 'should assign user and show listings' do
    get :show, params: {id: @u1.id}
    expect(assigns(:user)).to eq(@u1)
  end
end

describe 'update' do
  it 'should update user ratings' do
    booking = Booking.create!(user_id: @u1.id, storage_id: 1)
    patch :update, params: {user_id: @u1.id, id: booking.storage_id, booking: {user_rating: 4.5}}
    expect(booking.reload.user_rating).to eq(4.5)
    expect(response).to redirect_to(profile_path(@u1))
  end
end


end