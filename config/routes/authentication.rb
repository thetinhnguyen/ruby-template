# frozen_string_literal: true

devise_for :users, skip: :all

namespace :users do
  use_doorkeeper do
    controllers tokens: 'tokens'
    skip_controllers :applications, :authorized_applications, :authorizations
  end
  post 'send_otp', to: 'auth#send_otp'
  post 'verify_otp', to: 'auth#verify_otp'
  post 'sign_up', to: 'auth#sign_up', as: :registration
end
