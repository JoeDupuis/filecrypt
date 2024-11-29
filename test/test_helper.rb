ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    def sop
      save_and_open_page
    end

    def login(user)
      user = users(user) unless user.is_a? User
      post session_url, params: { **user.slice(:email_address), password: "123123" }
      follow_redirect!
      assert_equal user, current_user
    end

    def logout
      delete session_url
      assert current_session.nil?
    end

    def current_session
      return unless cookie_jar[:session_id].present?
      Session.find_by(id: cookie_jar.signed[:session_id])
    end

    def current_user
      current_session&.user
    end

    def cookie_jar
      ActionDispatch::Cookies::CookieJar.build(request, cookies.to_hash)
    end
  end
end
