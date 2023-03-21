# frozen_string_literal: true

module Inputs
    module V1
      module User
        class VerifyOtpInput
          include Swagger::Blocks
  
          swagger_component do
            schema :VerifyOtpInput do
              key :required, %i[phone_number email kind send_method code]
  
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

              property :code do
                key :type, :string
                key :example, '123456'
              end
            end
          end
        end
      end
    end
  end
  