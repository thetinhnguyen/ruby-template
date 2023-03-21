# frozen_string_literal: true

module Responses
  module V1
    module User
      class SignUpResponse
        include Swagger::Blocks

        swagger_component do
          schema :SignUpResponse do
            key :type, :object
            key :required, %i[id name phone_number email]
          end
        end
      end
    end
  end
end
