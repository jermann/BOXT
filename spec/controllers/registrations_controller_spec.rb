require 'rails_helper'

RSpec.describe Sessions::RegistrationsController, type: :controller do

  describe '#after_sign_up_path_for' do
  it 'redirects to root_path after sign up' do
    user = double('User')  # You may need to create a real or mock user object
    allow(controller).to receive(:root_path).and_return('/root_path')
    path = controller.after_sign_up_path_for(user)
    expect(path).to eq('/root_path')
  end
end

end
