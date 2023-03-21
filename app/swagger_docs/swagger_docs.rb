# frozen_string_literal: true

class SwaggerDocs
  include Swagger::Blocks

  COMMON_SWAGGERED_CLASSES = [
    ## Models ##
    Models::Shared::Pagination,
    Models::Shared::Meta,
    ## Responses ##
    Responses::Shared::ErrorResponse
  ].freeze

  V1_SWAGGERED_CLASSES = [
    ## Controllers ##
    # Controllers::V1::Users::TokensController,
    # Controllers::V1::Users::RegistrationsController,
    # Controllers::V1::Users::PasswordsController,
    Controllers::V1::Users::AuthController,
    ## Inputs ##

    Inputs::V1::User::SendOtpInput,
    Inputs::V1::User::VerifyOtpInput,
    Inputs::V1::User::SignUpInput,
    
    ## Responses ##
    Responses::V1::User::VerifyOtpResponse,
    Responses::V1::User::SignUpResponse,
    ## Models ##
    self
  ].concat(COMMON_SWAGGERED_CLASSES)

  V2_SWAGGERED_CLASSES = [
    self
  ].concat(COMMON_SWAGGERED_CLASSES)

  swagger_root do
    key :openapi, '3.0.0'

    info do
      key :version, '1.0.0'
      key :title, 'Salon Nails API'
      key :description, 'Salon Nails API'

      # contact do
      #   key :name, 'SHFT'
      #   key :url, 'https://shft.co'
      #   key :email, 'contact@shft.co'
      # end
    end

    server do
      url_options = Rails.application.routes.default_url_options
      key :url, "#{url_options[:protocol]}://#{url_options[:host]}"
      key :description, 'Salon Nails API'
    end
  end

  class << self
    def v1_swagger_root
      build_swagger_root(V1_SWAGGERED_CLASSES)
    end

    def v2_swagger_root
      build_swagger_root(V2_SWAGGERED_CLASSES)
    end

    private

    def build_swagger_root(classes)
      swagger_data = Swagger::Blocks.build_root_json(classes)

      swagger_data[:components][:securitySchemes] = {
        bearerAuth: {
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT'
        }
      }

      swagger_data[:security] = [{ bearerAuth: [] }]

      swagger_data
    end
  end
end
