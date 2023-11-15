require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def after_sign_in_path_for(resource)
      super(resource)
    end
  end

  describe '#after_sign_in_path_for' do
    it 'redirects to root_path after sign-in' do
      user = double('User')  # You may need to create a real or mock user object

      # Assuming you have a valid controller instance named `controller`
      allow(controller).to receive(:root_path).and_return('/root_path')

      # Assuming you have a valid user object to pass to the method
      path = controller.after_sign_in_path_for(user)

      expect(path).to eq('/root_path')
    end
  end
end