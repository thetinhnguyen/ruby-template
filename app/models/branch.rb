class Branch < ApplicationRecord
    has_one :provice
    has_one :district
    has_one :ward
    has_one :admin_user, :class_name => 'User'
end
