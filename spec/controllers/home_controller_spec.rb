require 'rails_helper'

RSpec.describe HomeController, type: :controller do

describe 'show storage' do
  it 'should show storage' do
    s = Storage.create(name: 'Storage A', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024')
    expect(Storage.find_by(name:'Storage A')).to_not be nil
    put :show, id: s.id
    expect(Storage.find_by(name:'Storage A')).to_not be nil
  end
end

describe 'create storage' do
  it 'should create a new storage' do
    expect(Storage.find_by(name:'Storage B')).to be nil
    put :create, storage: {name: 'Storage B', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024' }
    expect(Storage.find_by(name:'Storage B')).to_not be nil
  end
end

describe 'delete storage' do
  it 'should delete an existing storage' do
    
    s = Storage.create(name: 'Storage C', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024')
    expect(Storage.find_by(name:'Storage C')).to_not be nil

    delete :destroy, id: s.id
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

end
