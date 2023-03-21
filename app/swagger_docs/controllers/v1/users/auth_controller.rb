# frozen_string_literal: true

module Controllers
  module V1
    module Users
      class AuthController
        include Swagger::Blocks

        swagger_path '/v1/users/send_otp' do
          operation :post do
            key :summary, 'send opt'
            key :description, 'send opt'
            key :operationId, 'send opt'
            key :tags, [
              'User Auth'
            ]

            request_body do
              key :description, 'send_otp'
              key :required, true
              content :'application/json' do
                schema do
                  key :'$ref', :SendOtpInput
                end
              end
            end

            response 204 do
              key :description, 'Successful response'
              content :'application/json' do
                # schema do
                #   key :'$ref', :UserSignUpSuccessResponse
                # end
              end
            end

            response 422 do
              key :description, 'Something goes wrong'
              content :'application/json' do
                schema do
                  key :'$ref', :ErrorResponse
                end
              end
            end

            response 401 do
              key :description, 'Invalid client credentials passed'
              content :'application/json' do
                schema do
                  key :'$ref', :ErrorResponse
                end
              end
            end
          end
        end

        swagger_path '/v1/users/verify_otp' do
          operation :post do
            key :summary, 'verify_otp'
            key :description, 'verify_otpt'
            key :operationId, 'verify_otpt'
            key :tags, [
              'User Auth'
            ]

            request_body do
              key :description, 'verify_otp'
              key :required, true
              content :'application/json' do
                schema do
                  key :'$ref', :VerifyOtpInput
                end
              end
            end

            response 200 do
              key :description, 'Successful response'
              content :'application/json' do
                schema do
                  key :'$ref', :VerifyOtpResponse
                end
              end
            end

            response 422 do
              key :description, 'Something goes wrong'
              content :'application/json' do
                schema do
                  key :'$ref', :ErrorResponse
                end
              end
            end

            response 401 do
              key :description, 'Invalid client credentials passed'
              content :'application/json' do
                schema do
                  key :'$ref', :ErrorResponse
                end
              end
            end
          end
        end

        swagger_path '/v1/users/sign_up' do
          operation :post do
            key :summary, 'sign_up'
            key :description, 'sign_up'
            key :operationId, 'sign_up'
            key :tags, [
              'User Auth'
            ]

            request_body do
              key :description, 'sign_up'
              key :required, true
              content :'application/json' do
                schema do
                  key :'$ref', :SignUpInput
                end
              end
            end

            response 200 do
              key :description, 'Successful response'
              content :'application/json' do
                schema do
                  key :'$ref', :SignUpResponse
                end
              end
            end

            response 422 do
              key :description, 'Something goes wrong'
              content :'application/json' do
                schema do
                  key :'$ref', :ErrorResponse
                end
              end
            end

            response 401 do
              key :description, 'Invalid client credentials passed'
              content :'application/json' do
                schema do
                  key :'$ref', :ErrorResponse
                end
              end
            end
          end
        end
      end
    end
  end
end
