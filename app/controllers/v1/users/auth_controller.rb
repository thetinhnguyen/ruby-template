# frozen_string_literal: true

module V1
  module Users
    class AuthController < AuthenticatedController
      skip_before_action :doorkeeper_authorize!, only: %i[send_otp verify_otp]
      before_action :current_user, only: %i[sign_up]
      include DoorkeeperRegisterable
      def send_otp
        user=User.where(phone_number: send_otp_sms_params[:phone_number] , email: send_otp_sms_params[:email]).first
        # user have to exits in usecase sign_in
        if user.nil? && send_otp_sms_params[:send_method]=="sign_in"
          render json: {message: "Vui lòng đăng ký tài khoản"}, status: 400
        # check user valid
        elsif user && (user.email!=send_otp_sms_params[:email] || user.phone_number != send_otp_sms_params[:phone_number] )
          render json: {message: "Số điện thoại hoặc email đã tồn tại không đúng với tài khoản đăng ký trước đó."}, status: 400
        # create hash code to verify in the next time
        else
          verification_code=::VerificationCodeService.new.create(send_otp_sms_params[:phone_number],send_otp_sms_params[:email], send_otp_sms_params[:kind], send_otp_sms_params[:send_method])
          if verification_code
            render json: {} , status: 204
          else
            render error: {message: "Thực hiện gửi mã otp thất bại"}, status: 400
          end  
        end
      end

      def verify_otp
        user=User.where(phone_number: verify_otp_params[:phone_number] , email: verify_otp_params[:email]).first
        # user have to exits in usecase sign_in
        if user.nil? && send_otp_sms_params[:send_method]=="sign_in"
          render json: {message: "Vui lòng đăng ký tài khoản"}, status: 400
        # check user valid
        elsif user && (user.email!=verify_otp_params[:email] || user.phone_number != verify_otp_params[:phone_number] )
          render json: {message: "Số điện thoại hoặc email đã tồn tại không đúng với tài khoản đăng ký trước đó."}, status: 400
        # check hash code
        else
          hash=::VerificationCodeService.new.create_hash(verify_otp_params[:phone_number],verify_otp_params[:email], verify_otp_params[:kind], verify_otp_params[:send_method],verify_otp_params[:code])
          verficationCode=VerificationCode.where(hash_code: hash, kind: verify_otp_params[:kind], send_method: verify_otp_params[:send_method]).order("created_at DESC").first;
          if verficationCode.nil? || verficationCode.status.to_s == "verified"  
            render json: {message: "Mã otp không hợp lệ."}, status: 400
          elsif verficationCode.expiry_time < Time.zone.now.to_datetime
            render json: {message: "Mã otp đã hết hạn."}, status: 400
          else
            verficationCode.status=:verified
            verficationCode.changes
            verficationCode.save
            # create user
            response=user
            client_app = Doorkeeper::Application.find_by(uid: ENV["CLIENT_ID"])
            if user.nil?
              new_user=User.first_or_create(email: verify_otp_params[:email],
                     password: hash,
                     password_confirmation: hash,
                     phone_number: verify_otp_params[:phone_number])              
              response= render_user(new_user, client_app)
              
            else
              response= render_user(user, client_app)
            end
            
            render json: response, status: 200
          end
        end
      end
      def sign_up
        store=Store.new(name: sign_up_params[:name],phone_number: sign_up_params[:phone_number],email: sign_up_params[:email] ,admin_user_id: @current_user.id, branches: [Branch.new(name: sign_up_params[:name],phone_number: sign_up_params[:phone_number],email: sign_up_params[:email],provice_id: sign_up_params[:provice_id],district_id: sign_up_params[:district_id],ward_id: sign_up_params[:ward_id],detail_address: sign_up_params[:detail_address],admin_user_id: @current_user.id)])
        if store.save
          render json: store, status: 200
        else
          reder json: {message: "Tạo store thất bại"}, status: 400
        end
        

    
      end
      

      private

      def sign_up_params
        params.permit(:email, :phone_number, :name, :provice_id, :district_id, :ward_id, :detail_address)
      end
      def verify_otp_params
        params.permit(:phone_number, :email, :kind, :send_method, :code)
      end
      def send_otp_sms_params
        params.permit(:phone_number, :email, :kind, :send_method)
      end
      def create_access_token(user)
        Doorkeeper::AccessTokens::CreateService.new(user, current_doorkeeper_application).call
      end
    end
  end
end

