# spec/controllers/redirect_back_controller_spec.rb

require 'rails_helper'

RSpec.describe RedirectBackController, type: :controller do
  describe '#redirect' do
    it 'redirects to stored location if available' do
      session[:return_to] = '/stored_location'
      get :redirect
      expect(response).to redirect_to('/stored_location')
    end

    it 'redirects to root_path if stored location is nil' do
      session[:return_to] = nil
      get :redirect
      expect(response).to redirect_to(root_path)
    end
  end

  describe '#store_location' do
    it 'does not store referer if it includes "/users"' do
      request.env['HTTP_REFERER'] = 'http://example.com/users/sign_in'
      get :store_location
      expect(session[:return_to]).to be_nil
    end

    it 'redirects back to stored location if available' do
      request.env['HTTP_REFERER'] = 'http://example.com/page'
      get :store_location
      expect(response).to redirect_to('http://example.com/page')
    end

    it 'redirects to root_path if referer is nil' do
      request.env['HTTP_REFERER'] = nil
      get :store_location
      expect(response).to redirect_to(root_path)
    end

    it 'redirects back to root_path if stored location is nil' do
      request.env['HTTP_REFERER'] = 'http://example.com/users/sign_in'
      session[:return_to] = nil
      get :store_location
      expect(response).to redirect_to(root_path)
    end
  end
end
