class Store < ApplicationRecord
    has_one :admin_user, :class_name => 'User'
end
