require 'bcrypt'
class VerificationCodeService
    def generate_code
        "123456"
    end
    def create(mail_or_phone,kind,send_method)
        code=generate_code
        hash=create_hash(mail_or_phone,kind,send_method,code)
        verification_code= VerificationCode.new(hash_code: hash,expiry_time: Time.zone.now.to_datetime + ENV["OTP_DURATION"].to_i.seconds, kind: kind,send_method: send_method,mail_or_phone_to: mail_or_phone )
        verification_code.save
    end  
    def create_hash(mail_or_phone,kind,send_method,code)
        value = mail_or_phone + kind.to_s + send_method.to_s + code
        puts value
        result=BCrypt::Engine.hash_secret(value,ENV["BCRYPT_SALT"])
    end
end
