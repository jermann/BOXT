require 'spec_helper'
require 'rails_helper'
require 'storage_spec'

  describe 'GET show' do
    it 'assigns the requested storage to @storage' do
      storage = create(:storage)
      get :show, params: { id: storage.id }
      expect(assigns(:storage)).to eq(storage)
    end

    it 'renders the show template' do
      storage = create(:storage)
      get :show, params: { id: storage.id }
      expect(response).to render_template('show')
    end
  end
