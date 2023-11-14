# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def create
    super do |resource|
      if session[:storage_id_to_book].present?
        storage = Storage.find(session[:storage_id_to_book])
        session[:storage_id_to_book] = nil
        redirect_to storage_path(storage), notice: 'Logged in successfully.'
      end
    end
  end
end
