class VerificationCode < ApplicationRecord
    enum :type, { :sign_in 0, :sign_up 1 }
    enum :send_method { :sms_otp 0, :email 1 }
end
