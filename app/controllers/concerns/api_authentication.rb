module ApiAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
    helper_method :authenticated?
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  private

  def authenticated?
    Current.api_key.present?
  end

  def require_authentication
    authenticate_or_request_with_http_token do |token, options|
      Current.api_key = ApiKey.find_by_token(token)
    end
  end
end
