# frozen_string_literal: true

module Inputs
  module V1
    module User
      class SendOtpInput
        include Swagger::Blocks

        swagger_component do
          schema :SendOtpInput do
            key :required, %i[phone_number email kind send_method]

            property :email do
              key :type, :string
              key :example, 'test@test.com'
            end

            property :phone_number do
              key :type, :string
              key :example, '0376846295'
            end

            property :kind do
              key :type, :string
              key :example, 'sign_up ||| sign_in'
            end

            property :send_method do
              key :type, :string
              key :example, 'otp_sms || email || otp_voice'
            end
          end
        end
      end
    end
  end
end
