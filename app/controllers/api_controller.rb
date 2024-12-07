class ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  include ApiAuthentication

  private

  def parameter_missing
    head :unprocessable_entity
  end
end
