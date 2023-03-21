# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ParameterObjects
  def current_user
    return unless doorkeeper_token

    @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
  end
end
