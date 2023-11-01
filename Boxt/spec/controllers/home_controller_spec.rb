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

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
