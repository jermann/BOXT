require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  include Devise::Test::ControllerHelpers

  describe 'sortable_link' do
    it 'should create a link for table' do
      # u1 = User.create!(name: 'Harry Potter', email: 'harry.potter5@example.com', password: 'wizard123')
      # u2 = User.create!(name: 'Hermione Granger', email: 'hermione.granger5@example.com', password: 'libraryGirl')
      # s1 = Storage.create!(name: 'Storage C', available_space: 70, price: 10, campus_dist: 0.9, rating: 2.3, start_date: '10-May-2024', end_date: '10-Aug-2024', user: u1)
      # sign_in u1
      # params[:max_distance_from_campus] = 5
      # params[:max_price_per_sqft] = 15
      # params[:min_available_space] = 1
      # result = helper.sortable_link('available_space', 'Space (Sq ft)')
    end
  end



end