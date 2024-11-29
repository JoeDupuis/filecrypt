class AdminController < ActionController::Base
  include Authentication
  allow_unauthenticated_access
  before_action :require_admin

  def require_admin
    resume_session
    raise ActionController::RoutingError.new('Not Found') unless Current.user&.admin?
  end
end
