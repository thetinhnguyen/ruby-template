# frozen_string_literal: true

module V1
  module Users
    class RegistrationsController < ApplicationController
      # include Doorkeeper::Authorize
      def send_otp_sms
        verification_code=::VerificationCodeService.new.create(send_otp_sms_params[:phone_number],:sign_up,:sms_otp)
        if verification_code
          render json: {message: "Sent otp success"}, status: :ok
        else
          render error: {message: "Unable to create user."}, status: 400
        end  
      end
      def verify_otp
        hash=::VerificationCodeService.new.create_hash(verify_otp_params[:mail_or_phone],verify_otp_params[:kind],verify_otp_params[:send_method],verify_otp_params[:code])
        verficationCode=VerificationCode.where(hash_code: hash, kind: verify_otp_params[:kind], send_method: verify_otp_params[:send_method]).order("created_at DESC").first;
        if verficationCode.nil? || verficationCode.expiry_time < Time.zone.now.to_datetime || verficationCode.status.to_s == "verified"
          render json: {message: "Otp is invalid",a: verficationCode }, status: 400
        else
          verficationCode.status=:verified
          verficationCode.changes
          verficationCode.save
          render json: {a: verficationCode}, status: 200
        end
        
      end

      def create
        operation = ::Users::Registrations::CreateOperation.new(params: registration_params,
                                                                doorkeeper_application: current_doorkeeper_application).call

        if operation.success?
          render json: operation.success, status: :created
        else
          render json: operation.failure, status: :unprocessable_entity
        end
      end

      private

      def registration_params
        params.permit(:email, :password)
      end
      def send_otp_sms_params
        params.permit(:phone_number)
      end
      def verify_otp_params
        params.permit(:mail_or_phone,:kind,:send_method,:code)
      end
    end
  end
end
