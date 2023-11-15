require 'rails_helper'

RSpec.describe HomeController, type: :controller do

include Devise::Test::ControllerHelpers

describe 'show storage' do
  it 'should show storage' do
    s = Storage.create!(name: 'Storage A', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024')
    get :show, params: { id: s.id }
    expect(Storage.find_by(name:'Storage A')).to_not be nil
  end
end

describe 'create storage' do
  before(:each) do
    u1 = User.create!(name: 'Harry Potter', email: 'harry.potter@example.com', password: 'wizard123')
    @u1 = u1
    sign_in @u1
  end

  it 'should create a new storage when valid parameters are provided' do
    expect(Storage.find_by(name:'Storage A')).to be nil
    post :create, params: { storage: {name: 'Storage A', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024'}}
    expect(Storage.find_by(name:'Storage A')).to_not be nil
  end

  it 'should not work when invalid parameters are provided' do
    expect(Storage.find_by(name:'Storage A')).to be nil
    post :create, params: { storage: {name: '', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2023'}}
    expect(Storage.find_by(name:'Storage A')).to be nil
  end
end

describe 'update storage' do
  before(:each) do
    u1 = User.create!(name: 'Harry Potter', email: 'harry.potter@example.com', password: 'wizard123')
    u2 = User.create!(name: 'Hermione Granger', email: 'hermione.granger@example.com', password: 'libraryGirl')
    s1 = Storage.create!(name: 'Storage C', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024', user: u1)
    @u1 = u1
    @u2 = u2
    @s1 = s1
  end

  it 'books space and updates available space as a normal user' do
    sign_in @u2
    post :update, params: { id: @s1.id, storage: { book_space: 20 } }
    expect(response).to redirect_to('/')
    expect(flash[:notice]).to include('20 sq ft. booked in storage')
    expect(@s1.reload.available_space).to eq(50)
  end

  it 'updates any storage info as owner' do
    sign_in @u1
    post :update, params: { id: @s1.id, storage: { price: 15 } }
    expect(response).to redirect_to('/')
    expect(flash[:notice]).to include("'Storage C' updated.")
    expect(@s1.reload.price).to eq(15)
  end

  it 'redirects to edit page if update has invalid parameters' do
    sign_in @u1
    post :update, params: { id: @s1.id, storage: { end_date: '10-Aug-2023' } }

    expect(response).to redirect_to(edit_home_path(@s1))
  end

end

describe 'delete storage' do
  before(:each) do
    u1 = User.create!(name: 'Harry Potter', email: 'harry.potter@example.com', password: 'wizard123')
    u2 = User.create!(name: 'Hermione Granger', email: 'hermione.granger@example.com', password: 'libraryGirl')
    @u1 = u1
    @u2 = u2
    sign_in @u1
  end

  it 'should delete an existing storage if it is an authorized user' do
    
    s = Storage.create(name: 'Storage C', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024', user: @u1)
    expect(Storage.find_by(name:'Storage C')).to_not be nil

    delete :destroy, params: { id: s.id }
    expect(Storage.find_by(name:'Storage C')).to be nil
  end
end

describe "sort listings name" do
  before(:each) do
    s1 = Storage.create(name: 'Storage C', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024')
    s2 = Storage.create(name: 'Storage A', available_space: 50, price: 5, campus_dist: 0.5, rating: 1.3, start_date: '01-May-2024', end_date: '01-Aug-2024')
    @storages_list = Storage.all
  end

  it "should sort by name" do
    controller.sort_storages(@storages_list, "name", "asc").should == @storages_list.order!(name: 'asc')
  end

  it "should sort by available_space" do
    controller.sort_storages(@storages_list, "available_space", "asc").should == @storages_list.order!(available_space: 'asc')
  end

  it "should sort by price" do
    controller.sort_storages(@storages_list, "price", "asc").should == @storages_list.order!(price: 'asc')
  end

  it "should sort by campus_dist" do
    controller.sort_storages(@storages_list, "campus_dist", "asc").should == @storages_list.order!(campus_dist: 'asc')
  end

  it "should sort by rating" do
    controller.sort_storages(@storages_list, "rating", "asc").should == @storages_list.order!(rating: 'asc')
  end

  it "should sort by start_date" do
    controller.sort_storages(@storages_list, "start_date", "asc").should == @storages_list.order!(start_date: 'asc')
  end

  it "should sort by end_date" do
    controller.sort_storages(@storages_list, "end_date", "asc").should == @storages_list.order!(end_date: 'asc')
  end
end

describe "GET #index" do
  it "returns http success" do
    get :index
    expect(response).to have_http_status(:success)
  end
end

describe "authorize user" do
  before(:each) do
    u1 = User.create!(name: 'Harry Potter', email: 'harry.potter@example.com', password: 'wizard123')
    u2 = User.create!(name: 'Hermione Granger', email: 'hermione.granger@example.com', password: 'libraryGirl')
    s1 = Storage.create!(name: 'Storage C', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024', user: u1)
    @u1 = u1
    @u2 = u2
    @s1 = s1
  end

  it 'returns true if user is authorized' do
    allow(controller).to receive(:current_user).and_return(@u1)
    result = controller.authorize_user(@s1)
    expect(result).to be_truthy
  end

  it 'returns false if user is unauthorized' do
    allow(controller).to receive(:current_user).and_return(@u2)
    allow(controller).to receive(:redirect_to)
    result = controller.authorize_user(@s1)
    expect(result).to be_falsey
  end
    
end

end
