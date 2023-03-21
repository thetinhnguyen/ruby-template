# frozen_string_literal: true

module Inputs
  module V1
    module User
      class SignUpInput
        include Swagger::Blocks

        swagger_component do
          schema :SignUpInput do
            key :required, %i[phone_number email name provice_id district_id ward_id detail_address ]

            property :phone_number do
              key :type, :string
              key :example, '0376846295'
            end

            property :email do
              key :type, :string
              key :example, 'tinh121999@gmail.com'
            end

            property :name do
              key :type, :string
              key :example, 'Store 1'
            end
            property :provice_id do
              key :type, :string
              key :example, '33b358ef-a701-4650-95e2-3013035f806d'
            end
            property :district_id do
              key :type, :string
              key :example, '49a047d2-2679-4d48-83ee-b63ee17c6f37'
            end
            property :ward_id do
              key :type, :string
              key :example, 'ac8322c0-8984-43ef-be87-c60e5b26910e'
            end
            property :detail_address do
              key :type, :string
              key :example, '42 Trần Não'
            end

            
          end
        end
      end
    end
  end
end
