require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

include Devise::Test::ControllerHelpers

before(:each) do
  u1 = User.create!(name: 'Harry Potter', email: 'harry.potterp@example.com', password: 'wizard123')
  @u1 = u1
  @s1 = Storage.create!(name: 'Storage C', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024', user: @u1)
  @b1 = Booking.create!(user_id: @u1.id, storage_id: @s1.id)
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
    patch :update, params: {user_id: @u1.id, id: @b1.storage_id, booking: {user_rating: 4.5}}
    expect(@b1.reload.user_rating).to eq(4.5)
    expect(response).to redirect_to(profile_path(@u1))
  end
end


end