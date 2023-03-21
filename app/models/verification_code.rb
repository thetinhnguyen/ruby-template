class VerificationCode < ApplicationRecord
    enum kind: { sign_up: 0,sign_in: 1 }
    enum send_method: { otp_sms: 0, email: 1, otp_voice: 2 }
    enum status: { unverified: 0,verified:1 }
end
