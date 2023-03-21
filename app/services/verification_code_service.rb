require 'bcrypt'
class VerificationCodeService
    include Supports::Doorkeeper::CustomRegisterResponse
    def generate_code
        "123456"
    end
    def create(phone_number,email,kind,send_method)
        code=generate_code
        hash=create_hash(phone_number,email,kind,send_method,code)
        verification_code= VerificationCode.new(hash_code: hash,expiry_time: Time.zone.now.to_datetime + ENV["OTP_DURATION"].to_i.seconds, kind: kind,send_method: send_method,mail_or_phone_to: phone_number )
        verification_code.save
    end  
    def create_hash(phone_number,email,kind,send_method,code)
        value = phone_number + email  + kind.to_s + send_method.to_s + code
        puts value
        result=BCrypt::Engine.hash_secret(value,ENV["BCRYPT_SALT"])
    end
end
