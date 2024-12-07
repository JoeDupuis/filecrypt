class Current < ActiveSupport::CurrentAttributes
  attribute :session
  attribute :api_key

  def user
    session&.user || api_key&.bearer
  end
end
