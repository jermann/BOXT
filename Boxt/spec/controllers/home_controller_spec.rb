require 'rails_helper'

RSpec.describe HomeController, type: :controller do

describe 'create storage' do
  it 'should create a new storage' do
    expect(Storage.find_by(name:'Gargis home')).to be nil
    put :create, storage: {name: 'Gargis home', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024' }
    expect(Storage.find_by(name:'Gargis home')).to_not be nil
  end
end


describe 'delete storage' do
  it 'should delete an existing storage' do

    s = Storage.create(name: 'Gargis home', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024')
    expect(Storage.find_by(name:'Gargis home')).to_not be nil

    delete :destroy, id: s.id
    expect(Storage.find_by(name:'Gargis home')).to be nil
  end
end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
