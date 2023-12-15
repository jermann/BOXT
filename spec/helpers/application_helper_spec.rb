require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  include Devise::Test::ControllerHelpers

  describe 'sortable_link' do
    before(:each) do
      allow(helper).to receive(:params).and_return({
        sort_by: 'some_column',
        sort_direction: 'asc',
        min_available_space: 84,
      })
    end

    it 'should create a link for table' do
      result = helper.sortable_link('some_column', 'Some Column')
      expect(result).to include('sort_by=some_column')
      expect(result).to include('sort_direction=desc') # Updated expectation
      expect(result).to include('min_available_space=84')
    end

    it 'should create a link with ascending direction for other column' do
      result = helper.sortable_link('other_column', 'Other Column')
      expect(result).to include('sort_by=other_column')
      expect(result).to include('sort_direction=asc') # Updated expectation
      expect(result).to include('min_available_space=84')
    end
  end
end
